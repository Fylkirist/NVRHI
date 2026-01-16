project "NVRHI"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    flags { "NoPCH" }

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/**.cpp",
        "src/**.h",
        "src/**.hpp",
        "include/**.h",
        "include/**.hpp"
    }

    includedirs {
        "include",
        "src",
        "thirdparty",
        "thirdparty/Vulkan-Headers/include",
        "thirdparty/DirectX-Headers/include"
    }

    externalincludedirs {
        "thirdparty/Vulkan-Headers/include",
        "thirdparty/DirectX-Headers/include"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "Off"
        defines { "_CRT_SECURE_NO_WARNINGS", "WIN32", "VK_USE_PLATFORM_WIN32_KHR", "NOMINMAX", "WIN32_LEAN_AND_MEAN" }

    filter "system:linux"
        pic "On"
        systemversion "latest"
        staticruntime "Off"
        defines { "LINUX" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter {}
