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
 * Template Author:  Francesco Conti <fconti@iis.ee.ethz.ch>
 */

#include "pulp.h"
#include <stdint.h>
#include "archi/hwme/hwme_v1.h"
#include "hal/hwme/hwme_v1.h"
#include "rt/rt_api.h"

#define DEMO 1
#define SAFE 1  // use CBC instead of ECB

#define N 1  // Number of (identical) encryptions, max. 32 (only ECB)

#if SAFE
#define WORDS 4
#else
#define WORDS 1
#endif

int main() {
  #if DEMO
  printf("HWCE base addr: %x\n", HWME_ADDR_BASE);
  #endif

  // test data (storing in words instead of bytes solves ordering issues)
  uint32_t key[] = {0x2b7e1516, 0x28aed2a6, 0xabf71588, 0x09cf4f3c};

  #if SAFE
  uint32_t out[] = {0x7649abac, 0x8119b246, 0xcee98e9b, 0x12e9197d,
                    0x5086cb9b, 0x507219ee, 0x95db113a, 0x917678b2,
                    0x73bed6b8, 0xe3c1743b, 0x7116e69e, 0x22229516,
                    0x3ff1caa1, 0x681fac09, 0x120eca30, 0x7586e1a7};
  uint32_t in[]  = {0x6bc1bee2, 0x2e409f96, 0xe93d7e11, 0x7393172a,
                    0xae2d8a57, 0x1e03ac9c, 0x9eb76fac, 0x45af8e51,
                    0x30c81c46, 0xa35ce411, 0xe5fbc119, 0x1a0a52ef,
                    0xf69f2445, 0xdf4f9b17, 0xad2b417b, 0xe66c3710};
  #else
  uint32_t out[] = {0x3ad77bb4, 0x0d7a3660, 0xa89ecaf3, 0x2466ef97};
  uint32_t in[]  = {0x6bc1bee2, 0x2e409f96, 0xe93d7e11, 0x7393172a};
  #endif

  // pointers passed to HWCE
  uint32_t *a = (uint8_t *) 0x1c010000;
  uint32_t *b = (uint8_t *) 0x1c010200;
  uint32_t *d = (uint8_t *) 0x1c010400;
  uint32_t *r = (uint8_t *) 0x1c010600;

  #if DEMO
  unsigned long start_time, end_time, start_time_2, end_time_2;
  #endif
  volatile int errors = 0;

  int coreID = get_core_id();
  #if DEMO
  printf("hello from core %d!\n", coreID);
  #endif
 
  if(get_core_id() == 0) {
    
    // initialise data
    for(int i=0; i<4*WORDS*N; i++) { // output
      a[i] = in[i%(4*WORDS)];
    }
    for(int i=0; i<4*WORDS*N; i++) { // key
      b[i] = key[i%4];
    }
    for(int i=0; i<4*WORDS*N; i++) { // reference output
      r[i] = out[i%(4*WORDS)];
    }
    for(int i=0; i<4*WORDS*N; i++) { // output
      d[i] = 0;
    }

    #if DEMO
    printf("enable HWCE\n");
    start_time_2 = rt_time_get_us();
    #endif
    plp_hwme_enable();
    
    // aquire hwpe lock
    while(hwme_acquire_job() < 0);

    // set up bytecode (TODO hardwired ok?)
    hwme_bytecode_set(HWME_LOOPS1_OFFS,           0x00000000);
    hwme_bytecode_set(HWME_BYTECODE5_LOOPS0_OFFS, 0x00040000);
    hwme_bytecode_set(HWME_BYTECODE4_OFFS,        0x00000000);
    hwme_bytecode_set(HWME_BYTECODE3_OFFS,        0x00000000);
    hwme_bytecode_set(HWME_BYTECODE2_OFFS,        0x00000000);
    hwme_bytecode_set(HWME_BYTECODE1_OFFS,        0x000008cd);
    hwme_bytecode_set(HWME_BYTECODE0_OFFS,        0x11a13c05);
    
    // job-dependent registers
    hwme_a_addr_set((unsigned int) a);
    hwme_b_addr_set((unsigned int) b);
    hwme_d_addr_set((unsigned int) d);

    hwme_nb_iter_set(4*N*WORDS);
    hwme_len_iter_set(4*N*WORDS-1);  // input word count
    hwme_vectstride_set(4);
    hwme_vectstride2_set(4);

    hwme_shift_simplemul_set(hwme_shift_simplemul_value(0, 1));  // select simplemul mode: write results to continous memory

    // start HWME operation
    #if DEMO
    start_time = rt_time_get_us();
    #endif
    hwme_trigger_job();

    // wait for end of compuation
    soc_eu_fcEventMask_setEvent(ARCHI_SOC_EVENT_FCHWPE0);
    __rt_periph_wait_event(ARCHI_SOC_EVENT_FCHWPE0, 1);

    #if DEMO
    end_time = rt_time_get_us();
    #endif
    plp_hwme_disable();
    #if DEMO
    end_time_2 = rt_time_get_us();
    printf("finished HWCE operation\n");

    // check
    for(int j=0; j<N*WORDS*4; ++j) {
      
      if(d[j] != r[j]){
        printf("Expecting %x got %x\n", r[j], d[j]);
        errors++;
      }
    }
    #endif
  }
  #if DEMO
  printf("Encrypted 4x%d words with %d errors\n", N*WORDS, errors);
  printf("Runtime computation %lu us\n", end_time-start_time);
  printf("Full runtime %lu us\n", end_time_2-start_time_2);
  #endif
  synch_barrier();
  return errors;
}
