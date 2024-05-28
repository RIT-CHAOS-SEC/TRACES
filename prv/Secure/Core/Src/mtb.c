// implementation from https://interrupt.memfault.com/blog/instruction-tracing-mtb-m33

#include "mtb.h"
#include <stdint.h>

typedef struct __attribute__((packed)) MtbM33 {
  uint32_t POSITION;
  uint32_t MASTER;
  uint32_t FLOW;
  uint32_t BASE;
  uint32_t TSTART;
  uint32_t TSTOP;
  uint32_t SECURE;
} sMtbM33;
static sMtbM33 *const MTB = ((sMtbM33 *)0xE0043000);

int mtb_enable(size_t mtb_size) {
  if ((mtb_size < 16) || (__builtin_popcount(mtb_size) != 1)) {
    // MTB must be at least 16 bytes and be a power of 2
    return -1;
  }

  MTB->BASE = 0x30000034;

  // scrub MTB SRAM so it's easy to see what has gotten written to
  memset((void *)MTB->BASE, 0x0, mtb_size);
  const int mask = __builtin_ctz(mtb_size) - 4;

  // we are about to reconfigure so turn off MTB
  mtb_disable();

  // reset position
  MTB->POSITION = 0;

  // Start tracing!
  MTB->MASTER = (1 << 31) | (mask << 0);
  return 0;
}

int mtb_disable(void) {
  MTB->MASTER &= ~(1 << 31);
  return 0;
}
