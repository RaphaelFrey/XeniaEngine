workspace "Xenia"
	architecture "x64"
	
	startproject "Sandbox"

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
IncludeDir["Glad"] = "Xenia/vendor/Glad/include"
IncludeDir["ImGui"] = "Xenia/vendor/imgui"
IncludeDir["glm"] = "Xenia/vendor/glm"

include "Xenia/vendor/GLFW"
include "Xenia/vendor/Glad"
include "Xenia/vendor/imgui"

project "Xenia"
	location "Xenia"
	kind "SharedLib"
	language "C++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "xnpch.h"
	pchsource "Xenia/src/xnpch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links 
	{ 
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"

		defines
		{
			"XN_PLATFORM_WINDOWS",
			"XN_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

		postbuildcommands
        {
        	("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

	filter "configurations:Debug"
		defines "XN_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "XN_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "XN_DIST"
		runtime "Release"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "off"

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
		"Xenia/src",
		"Xenia/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Xenia"
	}

	filter "system:windows"
		cppdialect "C++17"
		systemversion "latest"
		staticruntime "off"

		defines
		{
			"XN_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "XN_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "XN_RELEASE"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "XN_DIST"
		runtime "Release"
		optimize "On"