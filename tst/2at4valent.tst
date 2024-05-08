############################################################################
##
#W    2at4valent.tst   GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
gap> START_TEST("GrSyLi package: 2at4valent.tst");

# Loading package
gap> LoadPackage("grsyli",false);
true

# 2AT_4VALENT_ORDER_MAX
gap> AT_4VALENT_ORDER_MAX;
640

# 2AT_4VALENT_NUMBERS
gap> Maximum(2AT_4VALENT_NUMBERS);
11

# 2AT4ValentGraphId
gap> gamma:=CompleteDigraph(5);;
gap> 2AT4ValentGraphId(gamma);
1
gap> gamma:=2AT4ValentGraph(1920,10);;
gap> 2AT4ValentGraphId(gamma);
10

# Set2AT4ValentGraphPropsNC
gap> gamma:=2AT4ValentGraph(1920,10);;
gap> Set2AT4ValentGraphPropsNC(gamma,1920,10);
gap> 2AT4ValentGraphId(gamma);
10

# Set2AT4ValentGraphProps
gap> gamma:=2AT4ValentGraph(1920,5);;
gap> Set2AT4ValentGraphProps(gamma);
gap> 2AT4ValentGraphId(gamma);
5

# Nr2AT4ValentGraphs
gap> Nr2AT4ValentGraphs(1920);
11

# 2AT4ValentGraph
gap> 2AT4ValentGraph(1920,3);
<immutable symmetric digraph with 1920 vertices, 7680 edges>
gap> 2AT4ValentGraph(1920,12);
fail

# All2AT4ValentGraphs
gap> gammas:=All2AT4ValentGraphs(1920);;
gap> Length(gammas);
11

# 2AT4ValentGraphIterator
gap> cnt:=0;; iter:=2AT4ValentGraphIterator(1920);;
gap> for gamma in iter do
> if HasSolvableAutGroup(gamma) then
> cnt:=cnt+1;
> fi;
> od;
gap> cnt;
0

# End test
gap> STOP_TEST("GrSyLi package: 2at4valent.tst",0);  
