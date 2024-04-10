############################################################################
##
#W    atd2valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: atd2valent.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# ATD_2VALENT_ORDER_MAX
gap> ATD_2VALENT_ORDER_MAX;
1000

# ATD_2VALENT_NUMBERS
gap> Maximum(ATD_2VALENT_NUMBERS);
2048

# ATD_2VALENT_INFO
gap> ATD_2VALENT_INFO[8,1];
[ true, 1, true, "GWG(4;1)", 1, true, 2, 72, true, 4, 8, "---", 2, 1, 2, 
  [ 4 ], false ]

# IdOfAT2ValentDigraph
gap> gamma:=AT2ValentDigraph(100,5);;
gap> IdOfAT2ValentDigraph(gamma);
5

# SetAT2ValentDigraphPropsNC
gap> gamma:=AT2ValentDigraph(150,5);;
gap> SetAT2ValentDigraphPropsNC(gamma,150,5);
gap> IsGeneralizedWreathDigraph(gamma);
false

# SetCubicVTGraphProps
gap> gamma:=AT2ValentDigraph(150,5);;
gap> SetAT2ValentDigraphProps(gamma);
gap> IsGeneralizedWreathDigraph(gamma);
false

# NrAT2ValentDigraphs
gap> NrAT2ValentDigraphs(500);
63

# AT2ValentDigraph
gap> AT2ValentDigraph(300,40);
<immutable digraph with 300 vertices, 600 edges>
gap> AT2ValentDigraph(300,100);
fail

# AllAT2ValentDigraphs
gap> gammas:=AllAT2ValentDigraphs(300,true);;
gap> ForAny(gammas,HasAbelianVertexStabilizer);
true

# IteratorOfAT2ValentDigraphs
gap> cnt:=0;; iter:=IteratorOfAT2ValentDigraphs(100,true);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
15

# IsSelfOppositeDigraph
gap> gamma:=AT2ValentDigraph(300,1);;
gap> IsSelfOppositeDigraph(gamma);
false
gap> gamma:=AT2ValentDigraph(300,20);;
gap> IsSelfOppositeDigraph(gamma);
true

# HasATUnderlyingGraph
gap> gamma:=AT2ValentDigraph(300,10);;
gap> HasATUnderlyingGraph(gamma);
false
gap> gamma:=AT2ValentDigraph(300,30,true);;
gap> HasATUnderlyingGraph(gamma);
true

# HasAbelianVertexStabilizer
gap> gammas:=AllAT2ValentDigraphs(700,true);;
gap> ForAll(gammas,HasAbelianVertexStabilizer);
true

# IsGeneralizedWreathDigraph
gap> gamma:=AT2ValentDigraph(700,30,true);;
gap> IsGeneralizedWreathDigraph(gamma);
false
gap> gamma:=AT2ValentDigraph(700,43,true);;
gap> IsGeneralizedWreathDigraph(gamma);
true

# NameOfUnderlyingGraph
gap> gamma:=AT2ValentDigraph(700,40,true);;
gap> NameOfUnderlyingGraph(gamma);
"GHAT[700;12]"

# MaximumArcTransitiveness
gap> gamma:=AT2ValentDigraph(748,18,true);;
gap> MaximumArcTransitiveness(gamma);
373

# StabIndexMinATUnd
gap> gammas:=AllAT2ValentDigraphs(420,true);;
gap> StabIndexMinATUnd(gammas[20]);
0
gap> StabIndexMinATUnd(gammas[40]);
2
gap> StabIndexMinATUnd(gammas[76]);
8

# StabIndexUnd
gap> gamma:=AT2ValentDigraph(420,96,true);;
gap> StabIndexMinATUnd(gamma);
2
gap> StabIndexUnd(gamma);
10141204801825835211973625643008

# AlterCycleRadius
gap> gamma:=AT2ValentDigraph(48,4,true);;
gap> AlterCycleRadius(gamma);
3

# AlterCycleAttachmentNo
gap> gamma:=AT2ValentDigraph(48,4,true);;
gap> AlterCycleAttachmentNo(gamma);
3

# AlterCycleAttachmentType
gap> gamma:=AT2ValentDigraph(48,4,true);;
gap> AlterCycleAttachmentType(gamma);
"tight"

# NrAlterCycles
gap> gamma:=AT2ValentDigraph(100,4,true);;
gap> NrAlterCycles(gamma);
10

# AlterExponent
gap> gamma:=AT2ValentDigraph(100,4,true);;
gap> AlterExponent(gamma);
1

# AlterPerimeter
gap> gamma:=AT2ValentDigraph(100,4,true);;
gap> AlterPerimeter(gamma);
10

# AlterSequence
gap> gamma:=AT2ValentDigraph(100,4,true);;
gap> AlterSequence(gamma);
[ 10 ]

# End test
gap> STOP_TEST("GrSyLi package: atd2valent.tst",0);  
