file(REMOVE_RECURSE
  "libprb.a"
  "libprb.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/prb.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
