############################################################################
##
#W    utils.tst   Cubic vertex-transitive graphs library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("CVT package: utils.tst");

# Loading package
gap> LoadPackage("cvt",false);
true

# CVT_ORDER_MAX
gap> CVT_ORDER_MAX;
1280

# CVT_NUMBER_GRAPHS
gap> Maximum(CVT_NUMBER_GRAPHS);
5692

# CVT_GRAPH_INFO
gap> CVT_GRAPH_INFO[8];
[ [ 2, 4, false, true, false, false, true, 1 ], 
  [ 3, 4, true, true, true, false, true, 1 ] ]

# IdOfCubicVTGraph
gap> gamma:=CubicVTGraph(8,2);;
gap> IdOfCubicVTGraph(gamma);
2
gap> gamma:=CycleDigraph(8);;
gap> IdOfCubicVTGraph(gamma);
fail

# SetCubicVTGraphPropsNC
gap> gamma:=CubicVTGraph(50,4);;
gap> SetCubicVTGraphPropsNC(gamma,50,4);
gap> IsSPXDigraphCVT(gamma);
false

# SetCubicVTGraphProps
gap> gamma:=CompleteDigraph(4);;
gap> SetCubicVTGraphProps(gamma);
gap> IsArcTransitiveDigraph(gamma);
true

# SmallCubicVTGraphInfo
gap> SmallCubicVTGraphsInfo(50);
  CVT: There are 9 cubic vertex-transitive graphs on 50 vertices.

  Of these 9 graphs, there are;
     - 6 bipartite graphs, 
     - 8 Cayley graphs, 
     - 1 arc-transitive graphs, 
     - 0 split Praeger-Xu graphs, 
     - 9 graphs with solvable automorphism group. 


# NrCubicVTGraphs
gap> NrCubicVTGraphs(1152);
5692

# CubicVTGraph
gap> CubicVTGraph(50,4);
<immutable symmetric digraph with 50 vertices, 150 edges>
gap> CubicVTGraph(50,10);
fail

# AllCubicVTGraphs
gap> gammas:=AllCubicVTGraphs(50,true);;
gap> List(gammas,IsSPXDigraphCVT);
[ false, false, false, false, false, false, false, false, false ]
gap> gammas:=AllCubicVTGraphs(100,true);;
gap> ForAny(gammas,IsSPXDigraphCVT);
true

# IteratorOfCubicVTGraphs
gap> cnt:=0;; iter:=IteratorOfCubicVTGraphs(912,true);
<iterator>
gap> for gamma in iter do
> if IsSPXDigraphCVT(gamma) then cnt:=cnt+1; fi;
> od;
gap> cnt;
3

# End test
gap> STOP_TEST("CVT package: utils.tst",0);  
