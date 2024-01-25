#############################################################################
##
#W    testall.g    Cubic vertex-transitive graphs library      Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
LoadPackage( "cvt" );

TestDirectory(DirectoriesPackageLibrary( "cvt", "tst" ),
  rec(exitGAP := true, 
  testOptions := rec(compareFunction := "uptowhitespace")));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error

#############################################################################
##
#E
