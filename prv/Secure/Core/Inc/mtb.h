// implementation from https://interrupt.memfault.com/blog/instruction-tracing-mtb-m33


#ifndef INC_MTB_H_
#define INC_MTB_H_

#include <stddef.h>

int mtb_enable(size_t size);
int mtb_disable(void);

#endif /* INC_MTB_H_ */
