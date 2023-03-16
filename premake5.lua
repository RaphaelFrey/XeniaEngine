workspace "Xenia"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Xenia"
	location "Xenia"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files 
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
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
	filter "configurations.Debug"
		defines "XN_DEBUG"
		symbols "On"

	filter "configurations.Release"
		defines "XN_RELEASE"
		optimize "On"

	filter "configurations.Dist"
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
		"%{prj.name}/src/**.cpp",
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

	filter "configurations.Debug"
		defines "XN_DEBUG"
		symbols "On"

	filter "configurations.Release"
		defines "XN_RELEASE"
		optimize "On"

	filter "configurations.Dist"
		defines "XN_DIST"
		optimize "On"