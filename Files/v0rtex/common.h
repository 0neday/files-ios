//
//  common.h
//  Files
//
//  Created by hongs on 2018/7/4.
//  Copyright © 2018 High Caffeine Content. All rights reserved.
//

#ifndef common_h
#define common_h

#include <mach/mach.h>

#include <mach-o/loader.h>
#include <stdint.h>             // uint*_t
#include <Foundation/Foundation.h>

#define LOG(str, args...) do { NSLog(@str "\n", ##args); } while(0)
#ifdef __LP64__
#   define ADDR "0x%016llx"
typedef uint64_t kptr_t;
#else
#   define ADDR "0x%08x"
typedef uint32_t kptr_t;
#endif


#endif /* common_h */
