message("========================================")
message("Loading custom HPX configuration")
message("========================================")
SET(USER_OPTIONS
    "-DHPX_WITH_TESTS=OFF"
    "-DHPX_WITH_EXAMPLES=OFF"
    "-DHPX_WITH_TOOLS=OFF"
    "-DHPX_WITH_DISTRIBUTED_RUNTIME=OFF"
    "-DHPX_WITH_NETWORKING=OFF"
    "-DHPX_HAVE_CXX17_STD_VARIANT=ON"
    "-DHPX_IGNORE_BOOST_COMPATIBILITY=ON"
    "-DHPX_IGNORE_COMPILER_COMPATIBILITY=ON"
    "-DHPX_CXX_STANDARD=20"
)


# Generic options
# --------------------------------------------------
# HPX_WITH_AUTOMATIC_SERIALIZATION_REGISTRATION:BOOL
#     Use automatic serialization registration for actions and functions. This affects compatibility between HPX applications compiled with different compilers (default ON)
# HPX_WITH_BENCHMARK_SCRIPTS_PATH:PATH
#     Directory to place batch scripts in
# HPX_WITH_BUILD_BINARY_PACKAGE:BOOL
#     Build HPX on the build infrastructure on any LINUX distribution (default: OFF).
# HPX_WITH_CHECK_MODULE_DEPENDENCIES:BOOL
#     Verify that no modules are cross-referenced from a different module category (default: OFF)
# HPX_WITH_COMPILER_WARNINGS:BOOL
#     Enable compiler warnings (default: ON)
# HPX_WITH_COMPILER_WARNINGS_AS_ERRORS:BOOL
#     Turn compiler warnings into errors (default: OFF)
# HPX_WITH_COMPRESSION_BZIP2:BOOL
#     Enable bzip2 compression for parcel data (default: OFF).
# HPX_WITH_COMPRESSION_SNAPPY:BOOL
#     Enable snappy compression for parcel data (default: OFF).
# HPX_WITH_COMPRESSION_ZLIB:BOOL
#     Enable zlib compression for parcel data (default: OFF).
# HPX_WITH_CUDA:BOOL
#     Enable support for CUDA (default: OFF)
# HPX_WITH_CXX_STANDARD:STRING
#     Set the C++ standard to use when compiling HPX itself. (default: 17)
# HPX_WITH_DATAPAR:BOOL
#     Enable data parallel algorithm support using Vc library (default: ON)
# HPX_WITH_DATAPAR_BACKEND:STRING
#     Define which vectorization library should be used. Options are: VC, EVE, STD_EXPERIMENTAL_SIMD, NONE
# HPX_WITH_DATAPAR_VC_NO_LIBRARY:BOOL
#     Don’t link with the Vc static library (default: OFF)
# HPX_WITH_DEPRECATION_WARNINGS:BOOL
#     Enable warnings for deprecated facilities. (default: ON)
# HPX_WITH_DISABLED_SIGNAL_EXCEPTION_HANDLERS:BOOL
#     Disables the mechanism that produces debug output for caught signals and unhandled exceptions (default: OFF)
# HPX_WITH_DYNAMIC_HPX_MAIN:BOOL
#     Enable dynamic overload of system main() (Linux and Apple only, default: ON)
# HPX_WITH_FAULT_TOLERANCE:BOOL
#     Build HPX to tolerate failures of nodes, i.e. ignore errors in active communication channels (default: OFF)
# HPX_WITH_FULL_RPATH:BOOL
#     Build and link HPX libraries and executables with full RPATHs (default: ON)
# HPX_WITH_GCC_VERSION_CHECK:BOOL
#     Don’t ignore version reported by gcc (default: ON)
# HPX_WITH_GENERIC_CONTEXT_COROUTINES:BOOL
#     Use Boost.Context as the underlying coroutines context switch implementation.
# HPX_WITH_HIDDEN_VISIBILITY:BOOL
#     Use -fvisibility=hidden for builds on platforms which support it (default OFF)
# HPX_WITH_HIP:BOOL
#     Enable compilation with HIPCC (default: OFF)
# HPX_WITH_LOGGING:BOOL
#     Build HPX with logging enabled (default: ON).
# HPX_WITH_MALLOC:STRING
#     Define which allocator should be linked in. Options are: system, tcmalloc, jemalloc, mimalloc, tbbmalloc, and custom (default is: tcmalloc)
# HPX_WITH_MODULES_AS_STATIC_LIBRARIES:BOOL
#     Compile HPX modules as STATIC (whole-archive) libraries instead of OBJECT libraries (Default: ON)
# HPX_WITH_NICE_THREADLEVEL:BOOL
#     Set HPX worker threads to have high NICE level (may impact performance) (default: OFF)
# HPX_WITH_PARCEL_COALESCING:BOOL
#     Enable the parcel coalescing plugin (default: ON).
# HPX_WITH_PKGCONFIG:BOOL
#     Enable generation of pkgconfig files (default: ON on Linux without CUDA/HIP, otherwise OFF)
# HPX_WITH_PRECOMPILED_HEADERS:BOOL
#     Enable precompiled headers for certain build targets (experimental) (default OFF)
# HPX_WITH_RUN_MAIN_EVERYWHERE:BOOL
#     Run hpx_main by default on all localities (default: OFF).
# HPX_WITH_STACKOVERFLOW_DETECTION:BOOL
#     Enable stackoverflow detection for HPX threads/coroutines. (default: OFF, debug: ON)
# HPX_WITH_STATIC_LINKING:BOOL
#     Compile HPX statically linked libraries (Default: OFF)
# HPX_WITH_UNITY_BUILD:BOOL
#     Enable unity build for certain build targets (default OFF)
# HPX_WITH_VIM_YCM:BOOL
#     Generate HPX completion file for VIM YouCompleteMe plugin
# HPX_WITH_ZERO_COPY_SERIALIZATION_THRESHOLD:STRING
#     The threshold in bytes to when perform zero copy optimizations (default: 128)

# Build Targets options
# --------------------------------------------------
# HPX_WITH_ASIO_TAG:STRING
#     Asio repository tag or branch
# HPX_WITH_COMPILE_ONLY_TESTS:BOOL
#     Create build system support for compile time only HPX tests (default ON)
# HPX_WITH_DISTRIBUTED_RUNTIME:BOOL
#     Enable the distributed runtime (default: ON). Turning off the distributed runtime completely disallows the creation and use of components and actions. Turning this option off is experimental!
# HPX_WITH_DOCUMENTATION:BOOL
#     Build the HPX documentation (default OFF).
# HPX_WITH_DOCUMENTATION_OUTPUT_FORMATS:STRING
#     List of documentation output formats to generate. Valid options are html;singlehtml;latexpdf;man. Multiple values can be separated with semicolons. (default html).
# HPX_WITH_EXAMPLES:BOOL
#     Build the HPX examples (default ON)
# HPX_WITH_EXAMPLES_HDF5:BOOL
#     Enable examples requiring HDF5 support (default: OFF).
# HPX_WITH_EXAMPLES_OPENMP:BOOL
#     Enable examples requiring OpenMP support (default: OFF).
# HPX_WITH_EXAMPLES_QT4:BOOL
#     Enable examples requiring Qt4 support (default: OFF).
# HPX_WITH_EXAMPLES_QTHREADS:BOOL
#     Enable examples requiring QThreads support (default: OFF).
# HPX_WITH_EXAMPLES_TBB:BOOL
#     Enable examples requiring TBB support (default: OFF).
# HPX_WITH_EXECUTABLE_PREFIX:STRING
#     Executable prefix (default none), ‘hpx_’ useful for system install.
# HPX_WITH_FAIL_COMPILE_TESTS:BOOL
#     Create build system support for fail compile HPX tests (default ON)
# HPX_WITH_FETCH_ASIO:BOOL
#     Use FetchContent to fetch Asio. By default an installed Asio will be used. (default: OFF)
# HPX_WITH_FETCH_LCI:BOOL
#     Use FetchContent to fetch LCI. By default an installed LCI will be used. (default: OFF)
# HPX_WITH_IO_COUNTERS:BOOL
#     Enable IO counters (default: ON)
# HPX_WITH_LCI_TAG:STRING
#     LCI repository tag or branch
# HPX_WITH_TESTS:BOOL
#     Build the HPX tests (default ON)
# HPX_WITH_TESTS_BENCHMARKS:BOOL
#     Build HPX benchmark tests (default: ON)
# HPX_WITH_TESTS_EXAMPLES:BOOL
#     Add HPX examples as tests (default: ON)
# HPX_WITH_TESTS_EXTERNAL_BUILD:BOOL
#     Build external cmake build tests (default: ON)
# HPX_WITH_TESTS_HEADERS:BOOL
#     Build HPX header tests (default: OFF)
# HPX_WITH_TESTS_REGRESSIONS:BOOL
#     Build HPX regression tests (default: ON)
# HPX_WITH_TESTS_UNIT:BOOL
#     Build HPX unit tests (default: ON)
# HPX_WITH_TOOLS:BOOL
#     Build HPX tools (default: OFF)

# Thread Manager options
# --------------------------------------------------
# HPX_COROUTINES_WITH_SWAP_CONTEXT_EMULATION:BOOL
#     Emulate SwapContext API for coroutines (Windows only, default: OFF)
# HPX_WITH_COROUTINE_COUNTERS:BOOL
#     Enable keeping track of coroutine creation and rebind counts (default: OFF)
# HPX_WITH_IO_POOL:BOOL
#     Disable internal IO thread pool, do not change if not absolutely necessary (default: ON)
# HPX_WITH_MAX_CPU_COUNT:STRING
#     HPX applications will not use more that this number of OS-Threads (empty string means dynamic) (default: “”)
# HPX_WITH_MAX_NUMA_DOMAIN_COUNT:STRING
#     HPX applications will not run on machines with more NUMA domains (default: 8)
# HPX_WITH_SCHEDULER_LOCAL_STORAGE:BOOL
#     Enable scheduler local storage for all HPX schedulers (default: OFF)
# HPX_WITH_SPINLOCK_DEADLOCK_DETECTION:BOOL
#     Enable spinlock deadlock detection (default: OFF)
# HPX_WITH_SPINLOCK_POOL_NUM:STRING
#     Number of elements a spinlock pool manages (default: 128)
# HPX_WITH_STACKTRACES:BOOL
#     Attach backtraces to HPX exceptions (default: ON)
# HPX_WITH_STACKTRACES_DEMANGLE_SYMBOLS:BOOL
#     Thread stack back trace symbols will be demangled (default: ON)
# HPX_WITH_STACKTRACES_STATIC_SYMBOLS:BOOL
#     Thread stack back trace will resolve static symbols (default: OFF)
# HPX_WITH_THREAD_BACKTRACE_DEPTH:STRING
#     Thread stack back trace depth being captured (default: 20)
# HPX_WITH_THREAD_BACKTRACE_ON_SUSPENSION:BOOL
#     Enable thread stack back trace being captured on suspension (default: OFF)
# HPX_WITH_THREAD_CREATION_AND_CLEANUP_RATES:BOOL
#     Enable measuring thread creation and cleanup times (default: OFF)
# HPX_WITH_THREAD_CUMULATIVE_COUNTS:BOOL
#     Enable keeping track of cumulative thread counts in the schedulers (default: ON)
# HPX_WITH_THREAD_IDLE_RATES:BOOL
#     Enable measuring the percentage of overhead times spent in the scheduler (default: OFF)
# HPX_WITH_THREAD_LOCAL_STORAGE:BOOL
#     Enable thread local storage for all HPX threads (default: OFF)
# HPX_WITH_THREAD_MANAGER_IDLE_BACKOFF:BOOL
#     HPX scheduler threads do exponential backoff on idle queues (default: ON)
# HPX_WITH_THREAD_QUEUE_WAITTIME:BOOL
#     Enable collecting queue wait times for threads (default: OFF)
# HPX_WITH_THREAD_STACK_MMAP:BOOL
#     Use mmap for stack allocation on appropriate platforms
# HPX_WITH_THREAD_STEALING_COUNTS:BOOL
#     Enable keeping track of counts of thread stealing incidents in the schedulers (default: OFF)
# HPX_WITH_THREAD_TARGET_ADDRESS:BOOL
#     Enable storing target address in thread for NUMA awareness (default: OFF)
# HPX_WITH_TIMER_POOL:BOOL
#     Disable internal timer thread pool, do not change if not absolutely necessary (default: ON)

# AGAS options
# --------------------------------------------------
# HPX_WITH_AGAS_DUMP_REFCNT_ENTRIES:BOOL
#     Enable dumps of the AGAS refcnt tables to logs (default: OFF)

# Parcelport options
# --------------------------------------------------
# HPX_WITH_NETWORKING:BOOL
#     Enable support for networking and multi-node runs (default: ON)
# HPX_WITH_PARCELPORT_ACTION_COUNTERS:BOOL
#     Enable performance counters reporting parcelport statistics on a per-action basis.
# HPX_WITH_PARCELPORT_COUNTERS:BOOL
#     Enable performance counters reporting parcelport statistics.
# HPX_WITH_PARCELPORT_LCI:BOOL
#     Enable the LCI based parcelport.
# HPX_WITH_PARCELPORT_LIBFABRIC:BOOL
#     Enable the libfabric based parcelport. This is currently an experimental feature
# HPX_WITH_PARCELPORT_MPI:BOOL
#     Enable the MPI based parcelport.
# HPX_WITH_PARCELPORT_TCP:BOOL
#     Enable the TCP based parcelport.
# HPX_WITH_PARCEL_PROFILING:BOOL
#     Enable profiling data for parcels
 
# Profiling options
# --------------------------------------------------
# HPX_WITH_APEX:BOOL
#     Enable APEX instrumentation support.
# HPX_WITH_ITTNOTIFY:BOOL
#     Enable Amplifier (ITT) instrumentation support.
# HPX_WITH_PAPI:BOOL
#     Enable the PAPI based performance counter.

# Debugging options
# --------------------------------------------------
# HPX_WITH_ATTACH_DEBUGGER_ON_TEST_FAILURE:BOOL
#     Break the debugger if a test has failed (default: OFF)
# HPX_WITH_PARALLEL_TESTS_BIND_NONE:BOOL
#     Pass –hpx:bind=none to tests that may run in parallel (cmake -j flag) (default: OFF)
# HPX_WITH_SANITIZERS:BOOL
#     Configure with sanitizer instrumentation support.
# HPX_WITH_TESTS_DEBUG_LOG:BOOL
#     Turn on debug logs (–hpx:debug-hpx-log) for tests (default: OFF)
# HPX_WITH_TESTS_DEBUG_LOG_DESTINATION:STRING
#     Destination for test debug logs (default: cout)
# HPX_WITH_TESTS_MAX_THREADS_PER_LOCALITY:STRING
#     Maximum number of threads to use for tests (default: 0, use the number of threads specified by the test)
# HPX_WITH_THREAD_DEBUG_INFO:BOOL
#     Enable thread debugging information (default: OFF, implicitly enabled in debug builds)
# HPX_WITH_THREAD_DESCRIPTION_FULL:BOOL
#     Use function address for thread description (default: OFF)
# HPX_WITH_THREAD_GUARD_PAGE:BOOL
#     Enable thread guard page (default: ON)
# HPX_WITH_VALGRIND:BOOL
#     Enable Valgrind instrumentation support.
# HPX_WITH_VERIFY_LOCKS:BOOL
#     Enable lock verification code (default: OFF, enabled in debug builds)
# HPX_WITH_VERIFY_LOCKS_BACKTRACE:BOOL
#     Enable thread stack back trace being captured on lock registration (to be used in combination with HPX_WITH_VERIFY_LOCKS=ON, default: OFF)

# Modules options
# --------------------------------------------------
# HPX_DATASTRUCTURES_WITH_ADAPT_STD_TUPLE:BOOL
#     Enable compatibility of hpx::tuple with std::tuple. (default: ON)
# HPX_FILESYSTEM_WITH_BOOST_FILESYSTEM_COMPATIBILITY:BOOL
#     Enable Boost.FileSystem compatibility. (default: OFF)
# HPX_ITERATOR_SUPPORT_WITH_BOOST_ITERATOR_TRAVERSAL_TAG_COMPATIBILITY:BOOL
#     Enable Boost.Iterator traversal tag compatibility. (default: OFF)
# HPX_SERIALIZATION_WITH_ALLOW_CONST_TUPLE_MEMBERS:BOOL
#     Enable serializing std::tuple with const members. (default: OFF)
# HPX_SERIALIZATION_WITH_ALLOW_RAW_POINTER_SERIALIZATION:BOOL
#     Enable serializing raw pointers. (default: OFF)
# HPX_SERIALIZATION_WITH_ALL_TYPES_ARE_BITWISE_SERIALIZABLE:BOOL
#     Assume all types are bitwise serializable. (default: OFF)
# HPX_SERIALIZATION_WITH_BOOST_TYPES:BOOL
#     Enable serialization of certain Boost types. (default: OFF)
# HPX_SERIALIZATION_WITH_SUPPORTS_ENDIANESS:BOOL
#     Support endian conversion on inout and output archives. (default: OFF)
# HPX_TOPOLOGY_WITH_ADDITIONAL_HWLOC_TESTING:BOOL
#         Enable HWLOC filtering that makes it report no cores, this is purely an option supporting better testing - do not enable under normal circumstances. (default: OFF)
# HPX_WITH_POWER_COUNTER:BOOL
#     Enable use of performance counters based on pwr library (default: OFF)

# Additional tools and libraries used by HPX
# --------------------------------------------------
# Here is a list of additional libraries and tools that are either optionally supported by the build system or are optionally required for certain examples or tests. These libraries and tools can be detected by the HPX build system.
# Each of the tools or libraries listed here will be automatically detected if they are installed in some standard location. If a tool or library is installed in a different location, you can specify its base directory by appending _ROOT to the variable name as listed below. For instance, to configure a custom directory for BOOST, specify BOOST_ROOT=/custom/boost/root.
# BOOST_ROOT:PATH
#     Specifies where to look for the Boost installation to be used for compiling HPX. Set this if CMake is not able to locate a suitable version of Boost. The directory specified here can be either the root of an installed Boost distribution or the directory where you unpacked and built Boost without installing it (with staged libraries).
# HWLOC_ROOT:PATH
#     Specifies where to look for the hwloc library. Set this if CMake is not able to locate a suitable version of hwloc. Hwloc provides platform- independent support for extracting information about the used hardware architecture (number of cores, number of NUMA domains, hyperthreading, etc.). HPX utilizes this information if available.
# PAPI_ROOT:PATH
#     Specifies where to look for the PAPI library. The PAPI library is needed to compile a special component exposing PAPI hardware events and counters as HPX performance counters. This is not available on the Windows platform.
# AMPLIFIER_ROOT:PATH
#     Specifies where to look for one of the tools of the Intel Parallel Studio product, either Intel Amplifier or Intel Inspector. This should be set if the CMake variable HPX_USE_ITT_NOTIFY is set to ON. Enabling ITT support in HPX will integrate any application with the mentioned Intel tools, which customizes the generated information for your application and improves the generated diagnostics.
# In addition, some of the examples may need the following variables:
# HDF5_ROOT:PATH
#     Specifies where to look for the Hierarchical Data Format V5 (HDF5) include files and libraries.
 