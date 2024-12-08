############################################################################
##
#W    cet.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GraphSym package: cet.tst");

# Loading package
gap> LoadPackage("graphsym",false);
true

# CAT_ORDER_MAX
gap> CAT_ORDER_MAX;
10000

# CSS_ORDER_MAX
gap> CSS_ORDER_MAX;
10000

# CAT_NUMBER_GRAPHS
gap> Maximum(CAT_NUMBER_GRAPHS);
93

# CSS_NUMBER_GRAPHS
gap> Maximum(CSS_NUMBER_GRAPHS);
35

# CAT_GRAPH_INFO
#gap> CAT_GRAPH_INFO[8];
# TODO

# CSS_GRAPH_INFO
#gap> CSS_GRAPH_INFO[8];
# TODO

# CubicATGraphId
gap> gamma:=CubicATGraph(8192,40);;
gap> CubicATGraphId(gamma);
40
gap> gamma:=PetersenGraph();;
gap> CubicATGraphId(gamma);
1

# CubicSSGraphId
gap> gamma:=CubicSSGraph(6912,20);;
gap> CubicSSGraphId(gamma);
20

# SetCubicATGraphPropsNC
gap> gamma:=CubicATGraph(8192,40);;
gap> SetCubicATGraphPropsNC(gamma,8192,40);
gap> IsArcTransitiveDigraph(gamma);
true

# SetCubicSSGraphPropsNC
gap> gamma:=CubicSSGraph(6912,20);;
gap> SetCubicSSGraphPropsNC(gamma,6912,20);
gap> IsVertexTransitive(gamma);
false

# SetCubicATGraphProps
gap> gamma:=CompleteDigraph(4);;
gap> SetCubicATGraphProps(gamma);
gap> IsArcTransitiveDigraph(gamma);
true

# SetCubicSSGraphProps
gap> gamma:=CubicSSGraph(6912,25);;
gap> SetCubicSSGraphProps(gamma);
gap> IsVertexTransitive(gamma);
false

# NrCubicATGraphs
gap> NrCubicATGraphs(8192);
93

# NrCubicSSGraphs
gap> NrCubicSSGraphs(3888);
35

# CubicATGraph
gap> CubicATGraph(2048,4);
<immutable symmetric digraph with 2048 vertices, 6144 edges>
gap> CubicATGraph(2048,26);
fail

# CubicSSGraph
gap> CubicSSGraph(4374,10);
<immutable symmetric digraph with 4374 vertices, 13122 edges>
gap> CubicSSGraph(4374,30);
fail

# AllCubicATGraphs
gap> gammas:=AllCubicATGraphs(3072,true);;

#  List(gammas,IsSplitPraegerXuGraph);
# TODO
#  gammas:=AllCubicATGraphs(100,true);;
#  ForAny(gammas,IsSplitPraegerXuGraph);
# TODO

# AllCubicSSGraphs
gap> gammas:=AllCubicSSGraphs(7680,true);;

#gap> List(gammas,IsSplitPraegerXuGraph);
# TODO
#gap> gammas:=AllCubicSSGraphs(100,true);;
#gap> ForAny(gammas,IsSplitPraegerXuGraph);
# TODO

# CubicATGraphIterator
gap> cnt:=0;; iter:=CubicATGraphIterator(8192,true);;

# TODO
#gap> for gamma in iter do
#> if IsSplitPraegerXuGraph(gamma) then cnt:=cnt+1; fi;
#> od;
#gap> cnt;
# TODO

# CubicSSGraphIterator
gap> cnt:=0;; iter:=CubicSSGraphIterator(3888,true);;

# TODO
#gap> for gamma in iter do
#> if IsSplitPraegerXuGraph(gamma) then cnt:=cnt+1; fi;
#> od;
#gap> cnt;
# TODO

# End test
gap> STOP_TEST("GraphSym package: cet.tst",0);  