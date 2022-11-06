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

#include <stdio.h>
#include <stdint.h>
#include <stddef.h>
#include "rt/rt_api.h"

#include "aes.h"

#define DEMO 1
#define CBC 1  // use CBC instead of ECB
#define N 1  // Number of (identical) encryptions

static int test_encrypt_ecb(unsigned long *start_time, unsigned long *end_time);
static int test_encrypt_cbc(unsigned long *start_time, unsigned long *end_time);

int main()
{
  int exit;
  unsigned long start_time, end_time, runtime;
  
  #if DEMO
  printf("Hello from pulpissimo!\n");
  runtime = 0;
  #endif
  
  for(int i=0; i<N; ++i) {
    #if CBC
    exit = test_encrypt_cbc(&start_time, &end_time);
    #else
    exit = test_encrypt_ecb(&start_time, &end_time);
    #endif
    
    #if DEMO
    if (!exit) {
      runtime += end_time-start_time;
    } else {
      return -1;
    }
    #endif
  }
  
  #if DEMO
  printf("Status %d\n", exit);
  #if CBC
  printf("Runtime for 16x%d words (CBC): %lu us\n", N, runtime);
  #else
  printf("Runtime for 4x%d words (ECB): %lu us\n", N, runtime);
  #endif
  #endif
  return exit;
}

static int test_encrypt_ecb(unsigned long *start_time, unsigned long *end_time) {
    uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
    uint8_t out[] = { 0x3a, 0xd7, 0x7b, 0xb4, 0x0d, 0x7a, 0x36, 0x60, 0xa8, 0x9e, 0xca, 0xf3, 0x24, 0x66, 0xef, 0x97 };
    uint8_t in[]  = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a };
    struct AES_ctx ctx;
    
    AES_init_ctx(&ctx, key);
    
    #if DEMO
    *start_time = rt_time_get_us();
    #endif
    AES_ECB_encrypt(&ctx, in);
    #if DEMO
    *end_time = rt_time_get_us();

    if (0 == memcmp((char*) out, (char*) in, 16)) {
        //printf("SUCCESS!\n");
	    return(0);
    } else {
        //printf("FAILURE!\n");
	    return(1);
    }
    return 0 == memcmp((char*) out, (char*) in, 16);
    #else
    return 0;
    #endif
}

static int test_encrypt_cbc(unsigned long *start_time, unsigned long *end_time) {    
    uint8_t key[] = { 0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c };
    uint8_t out[] = { 0x76, 0x49, 0xab, 0xac, 0x81, 0x19, 0xb2, 0x46, 0xce, 0xe9, 0x8e, 0x9b, 0x12, 0xe9, 0x19, 0x7d,
                      0x50, 0x86, 0xcb, 0x9b, 0x50, 0x72, 0x19, 0xee, 0x95, 0xdb, 0x11, 0x3a, 0x91, 0x76, 0x78, 0xb2,
                      0x73, 0xbe, 0xd6, 0xb8, 0xe3, 0xc1, 0x74, 0x3b, 0x71, 0x16, 0xe6, 0x9e, 0x22, 0x22, 0x95, 0x16,
                      0x3f, 0xf1, 0xca, 0xa1, 0x68, 0x1f, 0xac, 0x09, 0x12, 0x0e, 0xca, 0x30, 0x75, 0x86, 0xe1, 0xa7 };
    uint8_t iv[]  = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f };
    uint8_t in[]  = { 0x6b, 0xc1, 0xbe, 0xe2, 0x2e, 0x40, 0x9f, 0x96, 0xe9, 0x3d, 0x7e, 0x11, 0x73, 0x93, 0x17, 0x2a,
                      0xae, 0x2d, 0x8a, 0x57, 0x1e, 0x03, 0xac, 0x9c, 0x9e, 0xb7, 0x6f, 0xac, 0x45, 0xaf, 0x8e, 0x51,
                      0x30, 0xc8, 0x1c, 0x46, 0xa3, 0x5c, 0xe4, 0x11, 0xe5, 0xfb, 0xc1, 0x19, 0x1a, 0x0a, 0x52, 0xef,
                      0xf6, 0x9f, 0x24, 0x45, 0xdf, 0x4f, 0x9b, 0x17, 0xad, 0x2b, 0x41, 0x7b, 0xe6, 0x6c, 0x37, 0x10 };

    struct AES_ctx ctx;
    AES_init_ctx(&ctx, key);
    AES_ctx_set_iv(&ctx, iv);
    
    #if DEMO
    *start_time = rt_time_get_us();
    #endif
    //AES_ECB_encrypt(&ctx, in);
    AES_CBC_encrypt_buffer(&ctx, in, 64);
    #if DEMO
    *end_time = rt_time_get_us();

    if (0 == memcmp((char*) out, (char*) in, 64)) {
      //printf("SUCCESS!\n");
	    return(0);
    } else {
       //printf("FAILURE!\n");
	    return(1);
    }
    #else
    return 0;
    #endif
}
