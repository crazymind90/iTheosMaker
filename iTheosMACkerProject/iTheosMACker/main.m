//
//  main.m
//  iTheosMACker
//
//  Created by CrazyMind90 on 11/04/2020.
//  Copyright © 2020 iTheosMACker. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        setuid(0);
        // Setup code that might create autoreleased objects goes here.
    }
    return NSApplicationMain(argc, argv);
}

#include <spawn.h>
#include <dlfcn.h>

#define FLAG_PLATFORMIZE (1 << 1)
#define _POSIX_SPAWN_DISABLE_ASLR 0x0100
#define _POSIX_SPAWN_ALLOW_DATA_EXEC 0x2000

extern char **environ;





void platformize_me() {
          void* handle = dlopen("/usr/lib/libjailbreak.dylib", RTLD_LAZY);
          if (!handle) return;
          
          // Reset errors
          dlerror();
          typedef void (*fix_entitle_prt_t)(pid_t pid, uint32_t what);
          fix_entitle_prt_t ptr = (fix_entitle_prt_t)dlsym(handle, "jb_oneshot_entitle_now");
          
          const char *dlsym_error = dlerror();
          if (dlsym_error) return;
          
          ptr(getpid(), FLAG_PLATFORMIZE);
      }

