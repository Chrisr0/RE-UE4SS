set(CMAKE_MODULE_LINKER_FLAGS "-libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/ea250a15c87040eb91960533676a2124/lib -libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/3d1c41712ce94db9828ceff75166519b/lib Zydis.lib Zycore.lib")
set(CMAKE_SHARED_LINKER_FLAGS "-libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/ea250a15c87040eb91960533676a2124/lib -libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/3d1c41712ce94db9828ceff75166519b/lib Zydis.lib Zycore.lib")
set(CMAKE_EXE_LINKER_FLAGS "-libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/ea250a15c87040eb91960533676a2124/lib -libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/3d1c41712ce94db9828ceff75166519b/lib Zydis.lib Zycore.lib")
set(CMAKE_CXX_FLAGS "-DZYCORE_STATIC_BUILD -DZYDIS_STATIC_BUILD -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/ea250a15c87040eb91960533676a2124/include -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/3d1c41712ce94db9828ceff75166519b/include")
set(CMAKE_C_FLAGS "-DZYCORE_STATIC_BUILD -DZYDIS_STATIC_BUILD -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/ea250a15c87040eb91960533676a2124/include -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/3d1c41712ce94db9828ceff75166519b/include")
set(CMAKE_MODULE_LINKER_FLAGS "-libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/602ad0928af14f54b12e5801a3ace3cc/lib -libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/820cf9474beb4bdc91b7b2a6ec1412c3/lib Zydis.lib Zycore.lib")
set(CMAKE_SHARED_LINKER_FLAGS "-libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/602ad0928af14f54b12e5801a3ace3cc/lib -libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/820cf9474beb4bdc91b7b2a6ec1412c3/lib Zydis.lib Zycore.lib")
set(CMAKE_EXE_LINKER_FLAGS "-libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/602ad0928af14f54b12e5801a3ace3cc/lib -libpath:C:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/820cf9474beb4bdc91b7b2a6ec1412c3/lib Zydis.lib Zycore.lib")
set(CMAKE_CXX_FLAGS "-DZYCORE_STATIC_BUILD -DZYDIS_STATIC_BUILD -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/602ad0928af14f54b12e5801a3ace3cc/include -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/820cf9474beb4bdc91b7b2a6ec1412c3/include")
set(CMAKE_C_FLAGS "-DZYCORE_STATIC_BUILD -DZYDIS_STATIC_BUILD -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zycore/v1.5.1/602ad0928af14f54b12e5801a3ace3cc/include -external:W0 -external:IC:/Users/Chris/AppData/Local/.xmake/packages/z/zydis/v4.1.1/820cf9474beb4bdc91b7b2a6ec1412c3/include")
cmake_minimum_required(VERSION 3.27)
include(FetchContent)
set(FETCHCONTENT_QUIET OFF)
# Add the preprocessor definition to fix mutex
add_definitions(-D_DISABLE_CONSTEXPR_MUTEX_CONSTRUCTOR)
FetchContent_Declare(PolyHook2
    GIT_REPOSITORY https://github.com/stevemk14ebr/PolyHook_2_0.git
    GIT_TAG fd2a88f09c8ae89440858fc52573656141013c7f
    GIT_PROGRESS ON)
if (${UE4SS_PolyHook_BUILD_SHARED})
    set(MAKE_POLYHOOK_DEPENDENCIES_SHARED ON)
    set(MAKE_POLYHOOK_DEPENDENCIES_STATIC OFF)
else ()
    set(MAKE_POLYHOOK_DEPENDENCIES_SHARED OFF)
    set(MAKE_POLYHOOK_DEPENDENCIES_STATIC ON)
endif ()
set(POLYHOOK_BUILD_DLL ON CACHE BOOL "Build dll & lib instead of tests" FORCE)
set(POLYHOOK_BUILD_SHARED_LIB ${MAKE_POLYHOOK_DEPENDENCIES_SHARED} CACHE BOOL "Build polyhook2 as shared libary" FORCE)
if (ue4ssCross STREQUAL "msvc-wine")
    set(POLYHOOK_USE_EXTERNAL_ZYDIS OFF CACHE BOOL "Use external zydis libary" FORCE)
else ()
    set(POLYHOOK_USE_EXTERNAL_ZYDIS ON CACHE BOOL "Use external zydis libary" FORCE)
endif ()
set(ASMJIT_STATIC ${MAKE_POLYHOOK_DEPENDENCIES_STATIC} CACHE BOOL "Build 'asmjit' library as static" FORCE)
set(POLYHOOK_BUILD_STATIC_RUNTIME OFF CACHE BOOL "Use static runtime" FORCE)
# prevent PolyHook from setting MSVC_RUNTIME_LIBRARY to "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL" by unsetting 'MSVC' var
set(TMP_MSVC ${MSVC})
unset(MSVC)
FetchContent_MakeAvailable(PolyHook2)
# re-enable 'install' and reset 'MSVC' since we're done adding PolyHook
set(MSVC ${TMP_MSVC})