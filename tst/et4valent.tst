############################################################################
##
#W    et4valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: et4valent.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# ET_4VALENT_ORDER_MAX
gap> ET_4VALENT_ORDER_MAX;
512

# ET_4VALENT_NUMBERS
gap> Maximum(ET_4VALENT_NUMBERS);
664

# IdOfET4ValentGraph
gap> gamma:=CompleteDigraph(5);;
gap> IdOfET4ValentGraph(gamma);
1
gap> gamma:=ET4ValentGraph(512,40);;
gap> IdOfET4ValentGraph(gamma);
40

# SetET4ValentGraphPropsNC
gap> gamma:=ET4ValentGraph(512,40);;
gap> SetET4ValentGraphPropsNC(gamma,512,40);
gap> IdOfET4ValentGraph(gamma);
40

# SetET4ValentGraphProps
gap> gamma:=ET4ValentGraph(512,40);;
gap> SetET4ValentGraphProps(gamma);
gap> IdOfET4ValentGraph(gamma);
40

# NrET4ValentGraphs
gap> NrET4ValentGraphs(400);
107

# ET4ValentGraph
gap> ET4ValentGraph(512,100);
<immutable symmetric digraph with 512 vertices, 2048 edges>
gap> ET4ValentGraph(512,700);
fail

# AllET4ValentGraphs
gap> gammas:=AllET4ValentGraphs(400);;
gap> Length(gammas);
107

# IteratorOfET4ValentGraphs
gap> cnt:=0;; iter:=IteratorOfET4ValentGraphs(300);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
44

# End test
gap> STOP_TEST("GrSyLi package: et4valent.tst",0);  
