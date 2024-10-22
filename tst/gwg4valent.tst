############################################################################
##
#W    gwg4valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GraphSym package: gwg4valent.tst");

# Loading package
gap> LoadPackage("graphsym",false);
true

# GWG_4VALENT_ORDER_MAX
gap> GWG_4VALENT_ORDER_MAX;
1000

# GWG_4VALENT_NUMBERS
gap> Maximum(GWG_4VALENT_NUMBERS);
6

# IdOfGW4ValentGraph
gap> gamma:=GW4ValentGraph(448,2);;
gap> IdOfGW4ValentGraph(gamma);
2

# SetGW4ValentGraphPropsNC
gap> gamma:=GW4ValentGraph(448,5);;
gap> SetGW4ValentGraphPropsNC(gamma,448,5);
gap> IsGeneralisedWreathGraph(gamma);
true

# SetGW4ValentGraphProps
gap> gamma:=GW4ValentGraph(448,5);;
gap> SetGW4ValentGraphProps(gamma);
gap> IsGeneralisedWreathGraph(gamma);
true

# NrGW4ValentGraphs
gap> NrGW4ValentGraphs(448);
6

# GW4ValentGraph
gap> GW4ValentGraph(448,3);
<immutable symmetric digraph with 448 vertices, 1792 edges>
gap> GW4ValentGraph(448,7);
fail

# AllGW4ValentGraphs
gap> gammas:=AllGW4ValentGraphs(448);;
gap> Length(gammas);
6

# IteratorOfGW4ValentGraphs
gap> cnt:=0;; iter:=IteratorOfGW4ValentGraphs(448);;
gap> for gamma in iter do
> cnt:=cnt+1;
> od;
gap> cnt;
6

# IsGeneralisedWreathGraph
gap> gamma:=GW4ValentGraph(448,4,true);;
gap> IsGeneralisedWreathGraph(gamma);
true

# End test
gap> STOP_TEST("GraphSym package: gwg4valent.tst",0);  
