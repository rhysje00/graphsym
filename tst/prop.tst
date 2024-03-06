############################################################################
##
#W    prop.tst   GRaphs with SYmmetries library        Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: prop.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# IsCubicDigraph
gap> IsCubicDigraph(CycleDigraph(5));
false
gap> IsCubicDigraph(CompleteDigraph(4));
true

# IsCayleyDigraphCVT
gap> gamma:=CubicVTGraph(50,2,true);;
gap> IsCayleyDigraphCVT(gamma);
true
gap> gamma:=CubicVTGraph(50,9,true);;
gap> IsCayleyDigraphCVT(gamma);
false

# IsArcTransitiveDigraph
gap> gamma:=CubicVTGraph(50,4,true);;
gap> IsArcTransitiveDigraph(gamma);
false
gap> gamma:=CubicVTGraph(50,8,true);;
gap> IsArcTransitiveDigraph(gamma);
true

# IsSPXDigraphCVT
gap> gamma:=CubicVTGraph(48,6,true);;
gap> IsSPXDigraphCVT(gamma);
false
gap> gamma:=CubicVTGraph(48,7,true);;
gap> IsSPXDigraphCVT(gamma);
true

# HasSolvableAutGroup
gap> gamma:=CubicVTGraph(102,15,true);;
gap> HasSolvableAutGroup(gamma);
true
gap> gamma:=CubicVTGraph(102,16,true);;
gap> HasSolvableAutGroup(gamma);
false

# SizeStabAut2CVT
gap> gamma:=CubicVTGraph(102,16,true);;
gap> SizeStabAut2CVT(gamma);
3

# End test
gap> STOP_TEST("CVT package: prop.tst",0);  
