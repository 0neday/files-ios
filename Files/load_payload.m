/*
 * set.m - High-level handler to set boot nonce
 *
 * Copyright (c) 2017 Siguza & tihmstar
 */

#include <errno.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <mach/mach.h>
#include <IOKit/IOKitLib.h>
#include <CoreFoundation/CoreFoundation.h>

#include "arch.h"
#include "exploit64.h"
//#include "nvpatch.h"
#include "load_payload.h"


#include <dlfcn.h>
#include <copyfile.h>
#include <stdio.h>
#include <spawn.h>
#include <unistd.h>
#include <mach/mach.h>
#include <mach-o/dyld.h>
#include <sys/stat.h>
#include <sys/mount.h>
#include <sys/utsname.h>


int party_hard(void)
{
	
	NSString *ver = [[NSProcessInfo processInfo] operatingSystemVersionString];
	
	struct utsname u;
	uname(&u);
	LOG("Device Name: %s", u.version);
	LOG("Device: %s", u.machine);
	LOG("iOS Version: %@", ver);

	int ret = 0;
	if(getuid() != 0) // Skip if we got root already
	{
			ret = -1;
			vm_address_t kbase = 0;
			task_t kernel_task = get_kernel_task(&kbase);
			LOG("kernel_task: 0x%x", kernel_task);
			printf("kernel base:  0x%lx\n",kbase);
			ret = 0;
	}
	return ret;
}


