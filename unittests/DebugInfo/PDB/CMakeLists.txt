set(LLVM_LINK_COMPONENTS
  DebugInfoCodeView
  DebugInfoMSF
  DebugInfoPDB
  )

set(DebugInfoPDBSources
  HashTableTest.cpp
  MappedBlockStreamTest.cpp
  StringTableBuilderTest.cpp
  MSFBuilderTest.cpp
  PDBApiTest.cpp
  TypeServerHandlerTest.cpp
  )

add_llvm_unittest(DebugInfoPDBTests
  ${DebugInfoPDBSources}
  )

target_link_libraries(DebugInfoPDBTests LLVMTestingSupport)