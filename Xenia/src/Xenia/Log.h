#pragma once

#include <memory.h>

#include "Core.h"
#include "spdlog/spdlog.h"

namespace Xenia {

	class XENIA_API Log
	{
	public:
		static void Init();
		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

// CORE LOG MACROS
#define XN_CORE_TRACE(...)		::Xenia::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define XN_CORE_INFO(...)		::Xenia::Log::GetCoreLogger()->info(__VA_ARGS__)
#define XN_CORE_WARN(...)		::Xenia::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define XN_CORE_ERROR(...)		::Xenia::Log::GetCoreLogger()->error(__VA_ARGS__)
#define XN_CORE_FATAL(...)		::Xenia::Log::GetCoreLogger()->critical(__VA_ARGS__)

// CLIENT LOG MACROS
#define XN_TRACE(...)			::Xenia::Log::GetClientLogger()->trace(__VA_ARGS__)
#define XN_INFO(...)			::Xenia::Log::GetClientLogger()->info(__VA_ARGS__)
#define XN_WARN(...)			::Xenia::Log::GetClientLogger()->warn(__VA_ARGS__)
#define XN_ERROR(...)			::Xenia::Log::GetClientLogger()->error(__VA_ARGS__)
#define XN_FATAL(...)			::Xenia::Log::GetClientLogger()->critical(__VA_ARGS__)
