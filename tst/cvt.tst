############################################################################
##
#W    cvt.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: cvt.tst");

# Loading package
gap> LoadPackage("grsyli",false);
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

# CubicVTGraphId
gap> gamma:=CubicVTGraph(8,2);;
gap> CubicVTGraphId(gamma);
2
gap> gamma:=CycleDigraph(8);;
gap> CubicVTGraphId(gamma);
fail

# SetCubicVTGraphPropsNC
gap> gamma:=CubicVTGraph(50,4);;
gap> SetCubicVTGraphPropsNC(gamma,50,4);
gap> IsSplitPraegerXuGraph(gamma);
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
gap> List(gammas,IsSplitPraegerXuGraph);
[ false, false, false, false, false, false, false, false, false ]
gap> gammas:=AllCubicVTGraphs(100,true);;
gap> ForAny(gammas,IsSplitPraegerXuGraph);
true

# CubicVTGraphIterator
gap> cnt:=0;; iter:=CubicVTGraphIterator(912,true);
<iterator>
gap> for gamma in iter do
> if IsSplitPraegerXuGraph(gamma) then cnt:=cnt+1; fi;
> od;
gap> cnt;
3

# IsCubicGraph
gap> IsCubicGraph(CycleDigraph(5));
false
gap> IsCubicGraph(CompleteDigraph(4));
true

# IsCayleyGraph
gap> gamma:=CubicVTGraph(50,2,true);;
gap> IsCayleyGraph(gamma);
true
gap> gamma:=CubicVTGraph(50,9,true);;
gap> IsCayleyGraph(gamma);
false

# IsArcTransitiveDigraph
gap> gamma:=CubicVTGraph(50,4,true);;
gap> IsArcTransitiveDigraph(gamma);
false
gap> gamma:=CubicVTGraph(50,8,true);;
gap> IsArcTransitiveDigraph(gamma);
true

# IsSplitPraegerXuGraph
gap> gamma:=CubicVTGraph(48,6,true);;
gap> IsSplitPraegerXuGraph(gamma);
false
gap> gamma:=CubicVTGraph(48,7,true);;
gap> IsSplitPraegerXuGraph(gamma);
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
gap> STOP_TEST("GrSyLi package: cvt.tst",0);  
