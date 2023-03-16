workspace "Xenia"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Xenia/vendor/GLFW/include"

include "Xenia/vendor/GLFW"

project "Xenia"
	location "Xenia"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "xnpch.h"
	pchsource "Xenia/src/xnpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links 
	{ 
		"GLFW",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"XN_PLATFORM_WINDOWS",
			"XN_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "XN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "XN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "XN_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Xenia/vendor/spdlog/include",
		"Xenia/src"
	}

	links
	{
		"Xenia"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"XN_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "XN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "XN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "XN_DIST"
		optimize "On"