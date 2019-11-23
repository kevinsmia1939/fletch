message("Running CPython install")

function( CopyFiles _inRegex _outDir )
  file( GLOB FILES_TO_COPY ${_inRegex} )
  if( FILES_TO_COPY )
    file( COPY ${FILES_TO_COPY} DESTINATION ${_outDir} )
  endif()
endfunction()

function( MoveFiles _inRegex _outDir )
  file( GLOB FILES_TO_COPY ${_inRegex} )
  if( FILES_TO_COPY )
    file( MOVE ${FILES_TO_COPY} DESTINATION ${_outDir} )
  endif()
endfunction()

CopyFiles( ${CPYTHON_BUILD_LOC}/Include/*.h ${fletch_BUILD_INSTALL_PREFIX}/include )
CopyFiles( ${CPYTHON_BUILD_LOC}/PC/*.h ${fletch_BUILD_INSTALL_PREFIX}/include )
CopyFiles( ${CPYTHON_BUILD_LOC}/PCbuild/*/*.exe ${fletch_BUILD_INSTALL_PREFIX}/bin )
CopyFiles( ${CPYTHON_BUILD_LOC}/PCbuild/*/*.dll ${fletch_BUILD_INSTALL_PREFIX}/bin )
CopyFiles( ${CPYTHON_BUILD_LOC}/PCbuild/*/*.lib ${fletch_BUILD_INSTALL_PREFIX}/lib )
CopyFiles( ${CPYTHON_BUILD_LOC}/PCbuild/*/*.pyd ${PYTHON_BASEPATH} )
CopyFiles( ${CPYTHON_BUILD_LOC}/Lib/* ${PYTHON_BASEPATH} )

if( EXISTS ${fletch_BUILD_INSTALL_PREFIX}/lib/python )
  MoveFiles( ${fletch_BUILD_INSTALL_PREFIX}/lib/python/* ${PYTHON_BASEPATH} )
  file( REMOVE ${fletch_BUILD_INSTALL_PREFIX}/lib/python )
endif()
