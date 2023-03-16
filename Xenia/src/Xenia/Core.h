#pragma once

#ifdef XN_PLATFORM_WINDOWS
    #ifdef XN_BUILD_DLL
        #define XENIA_API __declspec(dllexport)
    #else
        #define XENIA_API __declspec(dllimport)
    #endif
#else
    #error Xenia only supports Windows!
#endif
