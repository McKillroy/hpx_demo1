cmake_minimum_required(VERSION 3.25)

# Conditionally create compilation database for clang-tidy
LIST(FIND VCPKG_MANIFEST_FEATURES "tidy" dummyvar) 
if(NOT ${dummyvar} EQUAL "-1")
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON) #Creates the compilation database    
endif()

project(hpx_demo VERSION 0.0.1 LANGUAGES CXX)

SET(CMAKE_CXX_STANDARD 20)


add_subdirectory("src")


LIST(FIND VCPKG_MANIFEST_FEATURES "tidy" dummyvar) 
if(NOT ${dummyvar} EQUAL "-1")
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON) #Creates the compilation database    
    find_program(CLANG_TIDY_EXECUTABLE NAMES "clang-tidy" REQUIRED)
    set(CLANG_TIDY_COMMAND " \"${CLANG_TIDY_EXECUTABLE} -checks=-*,modernize-* \" ")
    message( "CLANG_TIDY_COMMAND  = ${CLANG_TIDY_COMMAND}" )    
    message(CLANG_TIDY_EXECUTABLE is ${CLANG_TIDY_EXECUTABLE})
    message(CLANG_TIDY_CONFIG is ${CLANG_TIDY_CONFIG})

    file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/clang-tidy)
    
    file(GLOB_RECURSE TIDY_EXAMPLES "src/**.cpp")
    
    set(TIDY_SOURCES ${TIDY_EXAMPLES} )
    
    # Set up clang-tidy target
    add_custom_target(clang-tidy ALL
    COMMAND ${CLANG_TIDY_EXECUTABLE}
        ${TIDY_EXAMPLES}
        -p ${CMAKE_BINARY_DIR}
        -header-filter=${CMAKE_SOURCE_DIR}/src
        > ${CMAKE_BINARY_DIR}/clang-tidy/clang-tidy-output.txt
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/clang-tidy
    COMMENT "Running clang-tidy on source files"
    VERBATIM
    )
endif()