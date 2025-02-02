
ExternalProject_Add(PROJ
  URL ${PROJ_file}
  URL_MD5 ${PROJ_md5}
  ${COMMON_EP_ARGS}
  ${COMMON_CMAKE_EP_ARGS}
  CMAKE_ARGS
    ${COMMON_CMAKE_ARGS}
    -DPROJ_LIB_SUBDIR:STRING=lib
    -DPROJ_INCLUDE_SUBDIR:STRING=include
    -DDATADIR:STRING=share/proj
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DBUILD_LIBPROJ_SHARED:BOOL=ON
    -DBUILD_TESTING:BOOL=OFF
    -DPROJ_TESTS:BOOL=OFF
  )

fletch_external_project_force_install(PACKAGE PROJ)

set(PROJ_ROOT ${fletch_BUILD_INSTALL_PREFIX} CACHE PATH "" FORCE)
set(PROJ4_ROOT ${fletch_BUILD_INSTALL_PREFIX} CACHE PATH "" FORCE)
set(PROJ_INCLUDE_DIR "${PROJ4_ROOT}/include" CACHE PATH "")
set(PROJ4_INCLUDE_DIR "${PROJ4_ROOT}/include" CACHE PATH "")

file(APPEND ${fletch_CONFIG_INPUT} "
########################################
# PROJ4
########################################
set(PROJ4_ROOT \${fletch_ROOT})
set(PROJ_ROOT \${fletch_ROOT})
set(PROJ4_INCLUDE_DIR \${fletch_ROOT}/include)
set(PROJ_INCLUDE_DIR \${fletch_ROOT}/include)

set(fletch_ENABLED_PROJ TRUE)
")
