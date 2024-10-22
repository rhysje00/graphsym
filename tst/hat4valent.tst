############################################################################
##
#W    hat4valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GraphSym package: hat4valent.tst");

# Loading package
gap> LoadPackage("graphsym",false);
true

# HAT_4VALENT_ORDER_MAX
gap> HAT_4VALENT_ORDER_MAX;
1000

# HAT_4VALENT_NUMBERS
gap> Maximum(HAT_4VALENT_NUMBERS);
185

# HAT4ValentGraphId
gap> gamma:=HAT4ValentGraph(768,20);;
gap> HAT4ValentGraphId(gamma);
20

# SetHAT4ValentGraphPropsNC
gap> gamma:=HAT4ValentGraph(768,20);;
gap> SetHAT4ValentGraphPropsNC(gamma,768,20);
gap> SizeStabAut(gamma);
8

# SetHAT4ValentGraphProps
gap> gamma:=HAT4ValentGraph(768,20);;
gap> SetHAT4ValentGraphProps(gamma);
gap> SizeStabAut(gamma);
8

# NrHAT4ValentGraphs
gap> NrHAT4ValentGraphs(600);
27

# HAT4ValentGraph
gap> HAT4ValentGraph(600,20);
<immutable symmetric digraph with 600 vertices, 2400 edges>
gap> HAT4ValentGraph(600,28);
fail

# AllHAT4ValentGraphs
gap> gammas:=AllHAT4ValentGraphs(600);;
gap> Length(gammas);
27

# HAT4ValentGraphIterator
gap> cnt:=0;; iter:=HAT4ValentGraphIterator(600);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
25

# HAT4ValentMetaCirculantClasses
gap> gamma:=HAT4ValentGraph(768,104,true);;
gap> HAT4ValentMetaCirculantClasses(gamma);
[ 2, 4 ]

# End test
gap> STOP_TEST("GraphSym package: hat4valent.tst",0);  
