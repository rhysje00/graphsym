#############################################################################
##
#W    utils.gd      GRaphs with SYmmetries library           Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the 4-valent generalised wreath
##  graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  GWG_4VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="GWG_4VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="GWG_4VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all 4-valent generalised wreath graphs graphs with at 
##  most <M>n</M> vertices. The number of 4-valent generalised wreath graphs
##  graphs stored for each <M>n</M> is stored in the list 
##  <Ref Var="GWG_4VALENT_NUMBERS"/>. This variable
##  is currently set to 1000. 
##    <Example>
##      <![CDATA[
##gap> GWG_4VALENT_ORDER_MAX;
##1000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  GWG_4VALENT_NUMBERS
##
##  <#GAPDoc Label="GWG_4VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="GWG_4VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of 4-valent generalised wreath graphs 
##  stored in this package
##  <P/>
##  For a positive integer <M>n</M>, 
##  <C>GWG_4VALENT_NUMBERS[</C><M>n</M><C>]</C> is the number of 
##  4-valent generalised wreath graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> Maximum(GWG_4VALENT_NUMBERS);
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("GWG_4VALENT_NUMBERS","Number of 4-valent GWGs stored");

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfGW4ValentGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfGW4ValentGraph">
##  <ManSection>
##  <Attr Name="IdOfGW4ValentGraph"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if <A>gamma</A> is isomorphic to a graph 
##  stored in this package, this function returns the index of the graph 
##  isomorphic to <A>gamma</A>. Otherwise, this function returns <K>fail</K>.
##  <P/>
##  The index <C>i</C> of a graph <C>gamma</C> in this library is the position 
##  at which the graph is stored relative to its number of vertices. 
##  In particular, if <C>gamma</C> has <C>n</C> vertices, then <C>gamma</C> will
##  be the <C>i</C>th entry of <C>AllGW4ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfGW4ValentGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GW4ValentGraph(448,2);;
##gap> IdOfGW4ValentGraph(gamma);
##2
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfGW4ValentGraph", IsDigraph );

################################################################################
##
#F  SetGW4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetGW4ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="SetGW4ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A> with respect to the components of the entry of
##  <Ref Var="GWG_4VALENT_GRAPH_INFO"/> with order <A>n</A> and index <A>i</A>. The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetGW4ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=GW4ValentGraph(448,5);;
##gap> SetGW4ValentGraphPropsNC(gamma,448,5);
##gap> IsGeneralisedWreathGraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetGW4ValentGraphPropsNC" );

################################################################################
##
#F  SetGW4ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetGW4ValentGraphProps">
##  <ManSection>
##  <Func Name="SetGW4ValentGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package. This includes
##  <List>
##  <Item> All properties and attributes found in <Ref Var="GWG_4VALENT_GRAPH_INFO"/>.
##  </Item>
##  <Item> (<Ref Prop="IsCayleyGraph"/>).</Item>
##  <Item> <Ref BookName="Digraphs" Prop="IsVertexTransitive"/>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=GW4ValentGraph(448,5);;
##gap> SetGW4ValentGraphProps(gamma);
##gap> IsGeneralisedWreathGraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetGW4ValentGraphProps" );

################################################################################
##
#F  NrGW4ValentGraphs( <integer> )
#F  NumberGW4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="NrGW4ValentGraphs">
##  <ManSection>
##  <Func Name="NrGW4ValentGraphs"
##   Arg='n'/>
##  <Func Name="NumberGW4ValentGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  4-valent generalised wreath graphs with <A>n</A> vertices stored 
##  in this package.
##  <P/>
##  For any positive integers <M>n</M> up to 1000, the current package stores
##  all 4-valent generalised wreath graphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrGW4ValentGraphs(448);
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrGW4ValentGraphs" );
DeclareSynonym( "NumberGW4ValentGraphs", NrGW4ValentGraphs);

################################################################################
##
#F  GWG_4VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "GWG_4VALENT_Filename" );

#############################################################################
##
#F  GW4ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="GW4ValentGraph">
##  <ManSection>
##  <Func Name="GW4ValentGraph"
##   Arg='n,i[,data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  4-valent generalised wreath graph with <A>n</A> vertices available
##  in this package. If there is no such graph, the function returns <K>fail</K>. 
##    <Example>
##      <![CDATA[
##gap> GW4ValentGraph(448,3);
##<immutable symmetric digraph with 448 vertices, 1792 edges>
##gap> GW4ValentGraph(448,7);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GW4ValentGraph" );

#############################################################################
##
#F  AllGW4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllGW4ValentGraphs">
##  <ManSection>
##  <Func Name="AllGW4ValentGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all 4-valent generalised wreath graphs with <A>n</A> vertices 
##  available in this package. If there are no such graphs, the function returns
## <K>fail</K>.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllGW4ValentGraphs(448);;
##gap> Length(gammas);
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllGW4ValentGraphs" );

#############################################################################
##
#F  IteratorOfGW4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="IteratorOfGW4ValentGraphs">
##  <ManSection>
##  <Func Name="IteratorOfGW4ValentGraphs"
##   Arg='n[,data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all 4-valent generalised wreath graphs with <A>n</A> vertices 
##  available in this package. If there are such no graphs, the function returns
##  an empty iterator.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=IteratorOfGW4ValentGraphs(448);;
##gap> for gamma in iter do
##> cnt:=cnt+1;
##> od;
##gap> cnt;
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfGW4ValentGraphs" );

######################
##    PROPERTIES    ##
######################

################################################################################
##
#P  IsGeneralisedWreathGraph( <digraph> )
##  
##  <#GAPDoc Label="IsGeneralisedWreathGraph">
##  <ManSection>
##  <Prop Name="IsGeneralisedWreathGraph"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a 4-valent generalised wreath graph <A>gamma</A> from the &GRSYLI; 
##  package such that its properties and attributes have been assigned, 
##  this function returns <K>true</K>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GW4ValentGraph(448,4,true);;
##gap> IsGeneralisedWreathGraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsGeneralisedWreathGraph", IsDigraph);

#############################################################################
##
#E

