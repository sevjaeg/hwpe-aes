/*
 * Copyright (C) 2018 ETH Zurich and University of Bologna
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* 
 * Based on PULP Runtime Examples (https://github.com/pulp-platform/pulp-rt-examples)
 * Template Author:  Francesco Conti <fconti@iis.ee.ethz.ch>
 */

#include <stdint.h>
#include "pulp.h"
#include "rt/rt_api.h"
#include "archi/hwme/hwme_v1.h"
#include "hal/hwme/hwme_v1.h"

// ---------- Only change parameters in this section ----------
#define DEMO 1  // print out status, check results.
                // Set to 0 for power estimation
#define CBC 1  // use CBC instead of ECB (0 not supported by
                // default hw configuration)
#define DEBUG 0

// Number of (identical) encryptions - make sure to align 
// Max 32 otherwise illegal memory access for ECB
// Checks for CBC only work with N=1
#define N 1
// ------------------------------------------------------------

#if CBC
#define WORDS 4  // larger test vector (otherwise results identical to ECB)
#else
#define WORDS 1
#endif

int main() {

  // Test data (storing in words instead of bytes solves ordering issues)
  uint32_t key[] = {0x2b7e1516, 0x28aed2a6, 0xabf71588, 0x09cf4f3c};
  #if CBC
  // input words                  
  uint32_t in[]  = {0x6bc1bee2, 0x2e409f96, 0xe93d7e11, 0x7393172a,
                    0xae2d8a57, 0x1e03ac9c, 0x9eb76fac, 0x45af8e51,
                    0x30c81c46, 0xa35ce411, 0xe5fbc119, 0x1a0a52ef,
                    0xf69f2445, 0xdf4f9b17, 0xad2b417b, 0xe66c3710};
  // reference output
  uint32_t out[] = {0x7649abac, 0x8119b246, 0xcee98e9b, 0x12e9197d,
                    0x5086cb9b, 0x507219ee, 0x95db113a, 0x917678b2,
                    0x73bed6b8, 0xe3c1743b, 0x7116e69e, 0x22229516,
                    0x3ff1caa1, 0x681fac09, 0x120eca30, 0x7586e1a7};
  #else
  uint32_t in[]  = {0x6bc1bee2, 0x2e409f96, 0xe93d7e11, 0x7393172a};
  uint32_t out[] = {0x3ad77bb4, 0x0d7a3660, 0xa89ecaf3, 0x2466ef97};
  #endif

  // TCDM addresses for HWPE (currently hardwired in rtl/mac_fsm.sv)
  uint32_t *a = (uint8_t *) 0x1c010000;
  uint32_t *b = (uint8_t *) 0x1c010200;
  uint32_t *d = (uint8_t *) 0x1c010400;

  #if DEMO
  unsigned long start_time, end_time, start_time_2, end_time_2;
  volatile int errors = 0;
  #endif
  
  int coreID = get_core_id();
  #if DEMO
  printf("Hello from core %d!\n", coreID);
  printf("HWCE base addr: %x\n", HWME_ADDR_BASE);
  #endif
 
  if(coreID == 0) {
    for(int i=0; i<4*WORDS*N; i++) { // input
      a[i] = in[i%(4*WORDS)];
    }
    for(int i=0; i<4*WORDS*N; i++) { // key
      b[i] = key[i%4];
    }
    for(int i=0; i<4*WORDS*N; i++) { // output
      d[i] = 0;
    }

    #if DEMO
    printf("Enable HWCE\n");
    start_time_2 = rt_time_get_us();
    #endif

    plp_hwme_enable();
    soc_eu_fcEventMask_setEvent(ARCHI_SOC_EVENT_FCHWPE0);

    while(hwme_acquire_job() < 0);

    // hwme_a_addr_set((unsigned int) a);
    // hwme_b_addr_set((unsigned int) b);
    // hwme_d_addr_set((unsigned int) d);

    // input word count (has to be 4*X-1)
    hwme_len_iter_set(4*N*WORDS-1);

    #if DEBUG
    // Print config registers. Errornous in FPGA emulation without hardwired signals.
    printf("Addr a %x\n", HWME_READ(HWME_A_ADDR));
    printf("Addr b %x\n", HWME_READ(HWME_B_ADDR));
    printf("Addr d %x\n", HWME_READ(HWME_D_ADDR));
    printf("Len    %x\n", HWME_READ(HWME_LEN_ITER));
    #endif

    // start HWME operation
    #if DEMO
    start_time = rt_time_get_us();
    #endif

    #if DEBUG
    printf("Starting HWCE computation");
    #endif

    hwme_trigger_job();

    // wait for end of compuation
    __rt_periph_wait_event(ARCHI_SOC_EVENT_FCHWPE0, 1);
    
    #if DEMO
    end_time = rt_time_get_us();
    #endif
    plp_hwme_disable();
    #if DEMO
    end_time_2 = rt_time_get_us();
    printf("Finished HWCE computation\n");

    // check results
    for(int j=0; j<N*WORDS*4; ++j) {
      if(d[j] != out[j%(WORDS*4)]){
        printf("Expecting %x got %x\n", out[j%(WORDS*4)], d[j]);
        errors++;
      }
    }
    #endif
  }
  #if DEMO
  printf("Encrypted 4x%d 32-bit words with %d errors\n", N*WORDS, errors);
  printf("Computation runtime %lu us\n", end_time-start_time);
  printf("Full runtime        %lu us\n", end_time_2-start_time_2);
  #endif

  synch_barrier();

  #if DEMO
  return errors;
  #else
  return 0;
  #endif
}
