############################################################################
##
#W    at4valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: at4valent.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# AT_4VALENT_ORDER_MAX
gap> AT_4VALENT_ORDER_MAX;
640

# AT_4VALENT_NUMBERS
gap> Maximum(AT_4VALENT_NUMBERS);
280

# IdOfAT4ValentGraph
gap> gamma:=CompleteDigraph(5);;
gap> IdOfAT4ValentGraph(gamma);
1
gap> gamma:=AT4ValentGraph(50,2);;
gap> IdOfAT4ValentGraph(gamma);
2

# SetAT4ValentGraphPropsNC
gap> gamma:=AT4ValentGraph(50,2);;
gap> SetAT4ValentGraphPropsNC(gamma,50,2);
gap> IdOfAT4ValentGraph(gamma);
2

# SetAT4ValentGraphProps
gap> gamma:=CompleteDigraph(5);;
gap> SetAT4ValentGraphProps(gamma);
gap> IdOfAT4ValentGraph(gamma);
1

# NrCubicVTGraphs
gap> NrAT4ValentGraphs(640);
158

# AT4ValentGraph
gap> AT4ValentGraph(640,20);
<immutable symmetric digraph with 640 vertices, 2560 edges>
gap> AT4ValentGraph(640,159);
fail

# AllAT4ValentGraphs
gap> gammas:=AllAT4ValentGraphs(640);;
gap> Length(gammas);
158

# IteratorOfAT4ValentGraphs
gap> cnt:=0;; iter:=IteratorOfAT4ValentGraphs(400);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
39

# End test
gap> STOP_TEST("GrSyLi package: at4valent.tst",0);  
