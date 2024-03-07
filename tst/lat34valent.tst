############################################################################
##
#W    lat34valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: et4valent.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# LAT_34VALENT_ORDER_MAX
gap> LAT_34VALENT_ORDER_MAX;
1050

# LAT_34VALENT_NUMBERS
gap> Maximum(LAT_34VALENT_NUMBERS);
249

# IdOfLAT34ValentGraph
gap> gamma:=LAT34ValentGraph(896,20);;
gap> IdOfLAT34ValentGraph(gamma);
20

# SetLAT34ValentGraphPropsNC
gap> gamma:=LAT34ValentGraph(896,20);;
gap> SetLAT34ValentGraphPropsNC(gamma,896,20);
gap> IdOfLAT34ValentGraph(gamma);
20

# SetLAT34ValentGraphProps
gap> gamma:=LAT34ValentGraph(896,20);;
gap> SetLAT34ValentGraphProps(gamma);
gap> IdOfLAT34ValentGraph(gamma);
20

# NrLAT34ValentGraphs
gap> NrLAT34ValentGraphs(896);
249

# LAT34ValentGraph
gap> LAT34ValentGraph(896,200);
<immutable symmetric digraph with 896 vertices, 3072 edges>
gap> LAT34ValentGraph(896,300);
fail


# AllLAT34ValentGraphs
gap> gammas:=AllLAT34ValentGraphs(224);;
gap> Length(gammas);
22

# IteratorOfLAT34ValentGraphs
gap> cnt:=0;; iter:=IteratorOfET4ValentGraphs(300);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
44

# End test
gap> STOP_TEST("GrSyLi package: lat34valent.tst",0);  
