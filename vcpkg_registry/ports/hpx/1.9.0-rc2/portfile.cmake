message("**********************************************")
message("Entering HPX Portfile 1.9.0-rc2")
message("**********************************************")

if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)
endif()
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" HPX_WITH_STATIC_LINKING)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO STEllAR-GROUP/hpx
    REF 7476fc8455f1b1feb7159a4076b9e40320b35539
    SHA512 8b9fa3a9f6a990b08590cfef1b2e466bc3de6b2979443cf72976cef7a3e2eb0839eb7b9f9d494e14895b3a963b31fd1216c626d9d008eb191aad3d0523f9befc
    HEAD_REF stable    
)


vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
    "zlib"                    HPX_WITH_COMPRESSION_ZLIB
    "snappy"                  HPX_WITH_COMPRESSION_SNAPPY
    "bzip2"                   HPX_WITH_COMPRESSION_BZIP2
    "cuda"                    HPX_WITH_CUDA
    "mpi"                     HPX_WITH_PARCELPORT_MPI
    "mpi"                     HPX_WITH_PARCELPORT_MPI_MULTITHREADED    
)

if(NOT VCPKG_TARGET_ARCHITECTURE MATCHES "(x64|x86)")
    list(APPEND FEATURE_OPTIONS "-DHPX_WITH_GENERIC_CONTEXT_COROUTINES=ON")
endif()

file(REMOVE "${SOURCE_PATH}/cmake/FindBZip2.cmake") # Outdated

## Loading user overrides and -config
if (EXISTS "$ENV{HPX_USER_CONFIG}")
    include("$ENV{HPX_USER_CONFIG}")
endif()
message("--------------------------------------------------------------")
message("USER_OPTIONS: ${USER_OPTIONS}")
message("--------------------------------------------------------------")
message("FEATURE_OPTIONS: ${FEATURE_OPTIONS}")
message("--------------------------------------------------------------")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHPX_WITH_VCPKG=ON
        -DHPX_WITH_TESTS=OFF
        -DHPX_WITH_EXAMPLES=OFF
        -DHPX_WITH_TOOLS=OFF
        -DHPX_WITH_RUNTIME=OFF
        -DHPX_USE_CMAKE_CXX_STANDARD=ON
        ${FEATURE_OPTIONS}
        -DHPX_WITH_PKGCONFIG=OFF
        -DHPX_WITH_STATIC_LINKING=${HPX_WITH_STATIC_LINKING}
        -DHPX_WITH_PARCELPORT_TCP=ON
        -DHPX_WITH_THREAD_TARGET_ADDRESS=ON
        -DHPX_WITH_CHECK_MODULE_DEPENDENCIES=ON
        -DHPX_WITH_THREAD_IDLE_RATES=ON
        -DVCPKG_HOST_TRIPLET=${_HOST_TRIPLET}
        ${USER_OPTIONS}
)

vcpkg_cmake_install()

# post build cleanup
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/HPX)

file(GLOB_RECURSE CMAKE_FILES "${CURRENT_PACKAGES_DIR}/share/hpx/*.cmake")
foreach(CMAKE_FILE IN LISTS CMAKE_FILES)
    file(READ ${CMAKE_FILE} _contents)
    string(REGEX REPLACE
        "lib/([A-Za-z0-9_.-]+\\.dll)"
        "bin/\\1"
        _contents "${_contents}")
    string(REGEX REPLACE
        "lib/hpx/([A-Za-z0-9_.-]+\\.dll)"
        "bin/hpx/\\1"
        _contents "${_contents}")
    file(WRITE ${CMAKE_FILE} "${_contents}")
endforeach()

vcpkg_replace_string(
    "${CURRENT_PACKAGES_DIR}/share/${PORT}/HPXConfig.cmake"
    "set(HPX_BUILD_TYPE \"Release\")"
    "set(HPX_BUILD_TYPE \"\${CMAKE_BUILD_TYPE}\")")

vcpkg_replace_string(
    "${CURRENT_PACKAGES_DIR}/share/${PORT}/HPXMacros.cmake"
    "set(CMAKE_MODULE_PATH \${CMAKE_MODULE_PATH}"
    "list(APPEND CMAKE_MODULE_PATH")

file(INSTALL
    "${SOURCE_PATH}/LICENSE_1_0.txt"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_fixup_pkgconfig()

file(REMOVE "${CURRENT_PACKAGES_DIR}/bin/hpxcxx" "${CURRENT_PACKAGES_DIR}/debug/bin/hpxcxx")

file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/tools/${PORT}")
file(RENAME "${CURRENT_PACKAGES_DIR}/bin/hpxrun.py" "${CURRENT_PACKAGES_DIR}/tools/${PORT}/hpxrun.py")
vcpkg_replace_string("${CURRENT_PACKAGES_DIR}/tools/${PORT}/hpxrun.py" "'${CURRENT_INSTALLED_DIR}/tools/openmpi/bin/mpiexec'" "'mpiexec'")

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
