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

#ifdef XN_ENABLE_ASSERT
    #define XN_ASSERT(x, ...) {if(!(x)){XN_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } } 
    #define XN_CORE_ASSERT(x, ...) {if(!(x)){XN_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
    #define XN_ASSERT(x, ...)
    #define XN_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)

#define XN_BIND_EVENT_FN(fn) std::bind(&fn, this, std::placeholders::_1)
