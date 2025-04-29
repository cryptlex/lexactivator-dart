cmake_minimum_required(VERSION 3.14)
set(PROJECT_NAME "lexactivator")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "lexactivator_plugin")
set(archdetect_c_code "
#if defined(_M_ARM64) || defined(__aarch64__) || defined(__arm64__)
    #error cmake_ARCH arm64
#elif defined(__x86_64) || defined(__x86_64__) || defined(__amd64) || defined(_M_X64)
    #error cmake_ARCH x86_64
#endif
#error cmake_ARCH unknown
")

function(target_architecture output_var)
        file(WRITE "${CMAKE_BINARY_DIR}/arch.c" "${archdetect_c_code}")

        enable_language(C)

        # Detect the architecture in a rather creative way...
        # This compiles a small C program which is a series of ifdefs that selects a
        # particular #error preprocessor directive whose message string contains the
        # target architecture. The program will always fail to compile (both because
        # file is not a valid C program, and obviously because of the presence of the
        # #error preprocessor directives... but by exploiting the preprocessor in this
        # way, we can detect the correct target architecture even when cross-compiling,
        # since the program itself never needs to be run (only the compiler/preprocessor)
        try_run(
            run_result_unused
            compile_result_unused
            "${CMAKE_BINARY_DIR}"
            "${CMAKE_BINARY_DIR}/arch.c"
            COMPILE_OUTPUT_VARIABLE ARCH
            CMAKE_FLAGS CMAKE_OSX_ARCHITECTURES=${CMAKE_OSX_ARCHITECTURES}
        )

        # Parse the architecture name from the compiler output
        string(REGEX MATCH "cmake_ARCH ([a-zA-Z0-9_]+)" ARCH "${ARCH}")

        # Get rid of the value marker leaving just the architecture name
        string(REPLACE "cmake_ARCH " "" ARCH "${ARCH}")

        # If we are compiling with an unknown architecture this variable should
        # already be set to "unknown" but in the case that it's empty (i.e. due
        # to a typo in the code), then set it to unknown
        if (NOT ARCH)
            set(ARCH unknown)
        endif()

    set(${output_var} "${ARCH}" PARENT_SCOPE)
endfunction()

set(ARCH "")

target_architecture(ARCH)

message(ARCH="${ARCH}")

add_library(${PLUGIN_NAME} SHARED
  "lexactivator_plugin.cpp"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

# List of absolute paths to libraries that should be bundled with the plugin
if(ARCH STREQUAL "x86_64")
  set(lexactivator_bundled_libraries
  "${CMAKE_CURRENT_SOURCE_DIR}/win-x86-64/LexActivator.dll"
  PARENT_SCOPE
  )  
endif()

if(ARCH STREQUAL "arm64")
  set(lexactivator_bundled_libraries
  "${CMAKE_CURRENT_SOURCE_DIR}/win-arm64/LexActivator.dll"
  PARENT_SCOPE
  )
endif()
