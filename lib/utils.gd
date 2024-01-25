#############################################################################
##
#W    utils.gd    Cubic vertex-transitive graphs library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the cubic v-t graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  CVT_ORDER_MAX  
##
##  <#GAPDoc Label="CVT_ORDER_MAX">
##  <ManSection>
##  <Var Name="CVT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all cubic vertex-transitive graphs with at most <M>n</M> 
##  vertices. The number of cubic vertex-transitive graphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="CVT_NUMBER_GRAPHS"/>. This variable
##  is currently set to 1280. 
##    <Example>
##      <![CDATA[
##gap> CVT_ORDER_MAX;
##1280
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  CVT_NUMBER_GRAPHS  
##
##  <#GAPDoc Label="CVT_NUMBER_GRAPHS">
##  <ManSection>
##  <Var Name="CVT_NUMBER_GRAPHS"/>
##
##  <Description>
##  This variable stores the number of cubic vertex-transitive graphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>CVT_NUMBER_GRAPHS[</C><M>n</M><C>]</C> is the
##  number of cubic-transitive graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> CVT_NUMBER_GRAPHS[50];  
##9
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("CVT_NUMBER_GRAPHS","Number of cubic v-t graphs stored");

#############################################################################
##
#V  CVT_GRAPH_INFO  
##
##  <#GAPDoc Label="CVT_GRAPH_INFO">
##  <ManSection>
##  <Var Name="CVT_GRAPH_INFO"/>
##
##  <Description>
##  This variable stores various properties of the graphs stored in this 
##  package. 
##  <P/>
##  For each graph <M>\Gamma</M> stored in this package on <M>n</M> vertices
##  and with index <M>i</M> (the position in which <M>\Gamma</M> is stored 
##  relative to its number of vertices), 
##  <C>CVT_GRAPH_INFO[</C><M>n</M><C>,</C><M>i</M><C>]</C> contains a list
##  with the following entries:
##  <Enum>
##    <Item>The diameter of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphDiameter"/>).</Item>
##    <Item>The girth of the <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphUndirectedGirth"/>).</Item>
##    <Item>The bipartiteness of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="IsBipartiteDigraph"/>).</Item>
##    <Item>The Cayleyness of <M>\Gamma</M>
##          (<Ref Prop="IsCayleyDigraphCVT"/>).</Item>
##    <Item>The arc-transitiveness of <M>\Gamma</M>
##          (<Ref Prop="IsArcTransitiveDigraph"/>).</Item>   
##    <Item>The property of <M>\Gamma</M> being isomorphic to a a split 
##          Praeger-Xu graph (<Ref Prop="IsSPXDigraphCVT"/>).</Item>
##    <Item>The sovlability of the automorphism group of <M>\Gamma</M>
##          (<Ref Prop="HasSolvableAutGroup"/>).</Item>
##    <Item>TODO <C>("|Aut_v|_(2)")</C> 
##           (<Ref Attr="SizeStabAut2CVT"/>).</Item>
##  </Enum>
##    <Example>
##      <![CDATA[
##gap> CVT_GRAPH_INFO[8];
##[ [ 2, 4, false, true, false, false, true, 1 ], 
##  [ 3, 4, true, true, true, false, true, 1 ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable( "CVT_GRAPH_INFO" );

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfCubicVTGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfCubicVTGraph">
##  <ManSection>
##  <Attr Name="IdOfCubicVTGraph"
##   Arg='gamma'/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if <A>gamma</A> is isomorphic to a graph 
##  stored in this package, this function returns the index of the graph 
##  isomorphic to <A>gamma</A>. Otherwise, this function returns <K>fail</K>.
##  <P/>
##  The index <C>i</C> of a graph <C>gamma</C> in this library is the position 
##  at which the graph is stored relative to its number of vertices. 
##  In particular, if <C>gamma</C> has <C>n</C> vertices, then <C>gamma</C> will
##   be the <C>i</C>th entry of <C>AllCubicVTGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfCubicVTGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(8,2);;
##gap> IdOfCubicVTGraph(gamma);
##2
##gap> gamma:=CycleDigraph(8);;
##gap> IdOfCubicVTGraph(gamma);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfCubicVTGraph", IsDigraph );

################################################################################
##
#F  SetCubicVTGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetCubicVTGraphPropsNC">
##  <ManSection>
##  <Func Name="SetCubicVTGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A> with respect to the components of the entry of
##  <Ref Var="CVT_GRAPH_INFO"/> with order <A>n</A> and index <A>i</A>. The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetCubicVTGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(50,4);;
##gap> SetCubicVTGraphPropsNC(gamma,50,4);
##gap> IsSPXDigraphCVT(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetCubicVTGraphPropsNC" );

################################################################################
##
#F  SetCubicVTGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetCubicVTGraphProps">
##  <ManSection>
##  <Func Name="SetCubicVTGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package. This includes
##  <List>
##  <Item> All properties and attributes found in <Ref Var="CVT_GRAPH_INFO"/>.
##  </Item>
##  <Item> <Ref Prop="IsCubicDigraph"/>.</Item>
##  <Item> <Ref BookName="Digraphs" Prop="IsVertexTransitive"/>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteDigraph(4);;
##gap> SetCubicVTGraphProps(gamma);
##gap> IsArcTransitiveDigraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetCubicVTGraphProps" );

#############################################################################
##
#F  SmallCubicVTGraphsInfo  
##
##  <#GAPDoc Label="SmallCubicVTGraphsInfo">
##  <ManSection>
##  <Func Name="SmallCubicVTGraphsInfo"
##   Arg='n'/>
##  <Returns></Returns>
##  <Description>
##  Given a positive integer <A>n</A>, this function prints information on the
##  cubic vertex-transitive graphs on <A>n</A> vertices currently stored in this
##  package. This includes the total number of graphs, the enumeration status of
##  these graphs, and the number of graphs with several properties 
##  precomputed and stored in this library.
##    <Example>
##      <![CDATA[
##gap> SmallCubicVTGraphsInfo(50);
##  CVT: There are 9 cubic vertex-transitive graphs on 50 vertices.
##
##  Of these 9 graphs, there are;
##     - 6 bipartite graphs, 
##     - 8 Cayley graphs, 
##     - 1 arc-transitive graphs, 
##     - 0 split Praeger-Xu graphs, 
##     - 9 graphs with solvable automorphism group. 
##
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SmallCubicVTGraphsInfo" );

################################################################################
##
#F  NrCubicVTGraphs( <integer> )
#F  NumberCubicVTGraphs( <integer> )
##  
##  <#GAPDoc Label="NrCubicVTGraphs">
##  <ManSection>
##  <Func Name="NrCubicVTGraphs"
##   Arg='n'/>
##  <Func Name="NumberCubicVTGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  cubic vertex-transitive graphs with <A>n</A> vertices stored in this 
##  package.
##  <P/>
##  For any positive integers <M>n</M> up to 1280, the current package stores
##  all cubic vertex-transitive graphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrCubicVTGraphs(50);
##9
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrCubicVTGraphs" );
DeclareSynonym( "NumberAllCubicVTGraphs", NrCubicVTGraphs);

################################################################################
##
#F  CVT_Filename( <integer> )
##  
DeclareGlobalFunction( "CVT_Filename" );

#############################################################################
##
#F  CubicVTGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="CubicVTGraph">
##  <ManSection>
##  <Func Name="CubicVTGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  cubic vertex-transitive graph with <A>n</A> vertices available in this 
##  package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicVTGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> CubicVTGraph(50,4);
##<immutable symmetric digraph with 50 vertices, 150 edges>
##gap> CubicVTGraph(50,10);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CubicVTGraph" );

#############################################################################
##
#F  AllCubicVTGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllCubicVTGraphs">
##  <ManSection>
##  <Func Name="AllCubicVTGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all cubic vertex-transitive graphs with <A>n</A> vertices available in this 
##  package. If there are no such graphs, the function returns <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicVTGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllCubicVTGraphs(50,true);;
##gap> List(gammas,IsSPXDigraphCVT);
##[ false, false, false, false, false, false, false, false, false ]
##gap> gammas:=AllCubicVTGraphs(100,true);;
##gap> ForAny(gammas,IsSPXDigraphCVT);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllCubicVTGraphs" );

#############################################################################
##
#F  IteratorOfCubicVTGraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOfCubicVTGraphs">
##  <ManSection>
##  <Func Name="IteratorOfCubicVTGraphs"
##   Arg='n'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all cubic vertex-transitive graphs with <A>n</A> vertices available in this 
##  package. If there are such no graphs, the function returns an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicVTGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=IteratorOfCubicVTGraphs(1152,true);
##<iterator>
##gap> for gamma in iter do
##> if IsSPXDigraphCVT(gamma) then cnt:=cnt+1; fi;
##> od;
##gap> cnt;
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfCubicVTGraphs" );

#############################################################################
##
#E

