#############################################################################
##
#W    testall.g    GRaphs with SYmmetries library      Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
LoadPackage( "grsyli" );

TestDirectory(DirectoriesPackageLibrary( "grsyli", "tst" ),
  rec(exitGAP := true, 
  testOptions := rec(compareFunction := "uptowhitespace")));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error

#############################################################################
##
#E
