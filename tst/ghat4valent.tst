############################################################################
##
#W    ghat4valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: ghat4valent.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# GHAT_4VALENT_ORDER_MAX
gap> GHAT_4VALENT_ORDER_MAX;
1000

# GHAT_4VALENT_NUMBERS
gap> Maximum(GHAT_4VALENT_NUMBERS);
596

# GHAT4ValentGraphId
gap> gamma:=GHAT4ValentGraph(768,20);;
gap> GHAT4ValentGraphId(gamma);
20

# SetGHAT4ValentGraphPropsNC
gap> gamma:=GHAT4ValentGraph(768,20);;
gap> SetGHAT4ValentGraphPropsNC(gamma,768,20);
gap> SizeStabAut(gamma);
4

# SetGHAT4ValentGraphProps
gap> gamma:=GHAT4ValentGraph(768,20);;
gap> SetGHAT4ValentGraphProps(gamma);
gap> SizeStabAut(gamma);
4

# NrGHAT4ValentGraphs
gap> NrGHAT4ValentGraphs(600);
80

# GHAT4ValentGraph
gap> GHAT4ValentGraph(600,20);
<immutable symmetric digraph with 600 vertices, 2400 edges>
gap> GHAT4ValentGraph(600,81);
fail

# AllGHAT4ValentGraphs
gap> gammas:=AllGHAT4ValentGraphs(600);;
gap> Length(gammas);
80

# GHAT4ValentGraphIterator
gap> cnt:=0;; iter:=GHAT4ValentGraphIterator(600);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
57

# CayleyType
gap> gamma:=GHAT4ValentGraph(768,20,true);;
gap> CayleyType(gamma);
"Cay"

# SizeStabAut
gap> gamma:=GHAT4ValentGraph(768,20,true);;
gap> SizeStabAut(gamma);
4

# SizeStabGHATGroups
gap> gamma:=GHAT4ValentGraph(768,20,true);;
gap> SizeStabGHATGroups(gamma);
[ 2, 2, 2 ]

# ConsistentCycleTypes
gap> gamma:=GHAT4ValentGraph(768,20,true);;
gap> ConsistentCycleTypes(gamma);
[ "4s", "6s", "12s" ]

# End test
gap> STOP_TEST("GrSyLi package: ghat4valent.tst",0);  
