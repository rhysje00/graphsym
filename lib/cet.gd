#############################################################################
##
#W    utils.gd      GRaphs with SYmmetries library           Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the cubic e-t graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  CAT_ORDER_MAX  
##
##  <#GAPDoc Label="CAT_ORDER_MAX">
##  <ManSection>
##  <Var Name="CAT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all cubic arc-transitive graphs with at most <M>n</M> 
##  vertices. The number of cubic arc-transitive graphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="CAT_NUMBER_GRAPHS"/>. This variable
##  is currently set to 10000. 
##    <Example>
##      <![CDATA[
##gap> CAT_ORDER_MAX;
##10000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  CSS_ORDER_MAX  
##
##  <#GAPDoc Label="CSS_ORDER_MAX">
##  <ManSection>
##  <Var Name="CSS_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all cubic semisymmetric graphs with at most <M>n</M> 
##  vertices. The number of cubic semisymmetric graphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="CSS_NUMBER_GRAPHS"/>. This variable
##  is currently set to 10000. 
##    <Example>
##      <![CDATA[
##gap> CSS_ORDER_MAX;
##10000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  CET_ORDER_MAX  
##
##  <#GAPDoc Label="CET_ORDER_MAX">
##  <ManSection>
##  <Var Name="CET_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all cubic edge-transitive graphs with at most <M>n</M> 
##  vertices. The number of cubic edge-transitive graphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="CET_NUMBER_GRAPHS"/>. This variable
##  is currently set to 10000. 
##    <Example>
##      <![CDATA[
##gap> CET_ORDER_MAX;
##10000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  CAT_NUMBER_GRAPHS  
##
##  <#GAPDoc Label="CAT_NUMBER_GRAPHS">
##  <ManSection>
##  <Var Name="CAT_NUMBER_GRAPHS"/>
##
##  <Description>
##  This variable stores the number of cubic arc-transitive graphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>CAT_NUMBER_GRAPHS[</C><M>n</M><C>]</C> is the
##  number of cubic arc-transitive graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> CAT_NUMBER_GRAPHS[1008];  
##7
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("CAT_NUMBER_GRAPHS","Number of cubic a-t graphs stored");

#############################################################################
##
#V  CSS_NUMBER_GRAPHS  
##
##  <#GAPDoc Label="CSS_NUMBER_GRAPHS">
##  <ManSection>
##  <Var Name="CSS_NUMBER_GRAPHS"/>
##
##  <Description>
##  This variable stores the number of cubic semisymmetric graphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>CSS_NUMBER_GRAPHS[</C><M>n</M><C>]</C> is the
##  number of cubic semisymmetric graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> CSS_NUMBER_GRAPHS[1008];  
##6
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("CSS_NUMBER_GRAPHS","Number of cubic s-s graphs stored");

#############################################################################
##
#V  CET_NUMBER_GRAPHS  
##
##  <#GAPDoc Label="CET_NUMBER_GRAPHS">
##  <ManSection>
##  <Var Name="CET_NUMBER_GRAPHS"/>
##
##  <Description>
##  This variable stores the number of cubic edge-transitive graphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>CET_NUMBER_GRAPHS[</C><M>n</M><C>]</C> is the
##  number of cubic edge-transitive graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> CET_NUMBER_GRAPHS[1008];  
##13
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
#DeclareGlobalVariable("CET_NUMBER_GRAPHS","Number of cubic e-t graphs stored");

#  TODO Import properties
#############################################################################
##
#V  CAT_GRAPH_INFO  
##
##  <#GAPDoc Label="CAT_GRAPH_INFO">
##  <ManSection>
##  <Var Name="CAT_GRAPH_INFO"/>
##
##  <Description>
##  This variable stores various properties of the cubic arc-transitive graphs 
##  stored in this package. 
##  <P/>
##  For each cubic arc-transitive graph <M>\Gamma</M> stored in this package on 
##  <M>n</M> vertices and with index <M>i</M> (the position in which 
##  <M>\Gamma</M> is stored relative to its number of vertices), 
##  <C>CAT_GRAPH_INFO[</C><M>n</M><C>,</C><M>i</M><C>]</C> contains a list
##  with the following entries:
##  <Enum>
##    <Item>The diameter of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphDiameter"/>).</Item>
##    <Item>The girth of the <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphUndirectedGirth"/>).</Item>
##    <Item>The bipartiteness of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="IsBipartiteDigraph"/>).</Item>
##    <Item>The arc-transitiveness of <M>\Gamma</M>
##          (<Ref Prop="IsArcTransitiveDigraph"/>).</Item>   
##    <Item>The type of the automorphism group of <M>\Gamma</M>
##          (TODO function and definition ref).</Item>
##  </Enum>
##    <Example>
##      <![CDATA[
##gap> CAT_GRAPH_INFO[8];
##TODO
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable( "CAT_GRAPH_INFO" );

#############################################################################
##
#V  CSS_GRAPH_INFO  
##
##  <#GAPDoc Label="CSS_GRAPH_INFO">
##  <ManSection>
##  <Var Name="CSS_GRAPH_INFO"/>
##
##  <Description>
##  This variable stores various properties of the cubic semisymmetric graphs 
##  stored in this package. 
##  <P/>
##  For each cubic semisymmetric graph <M>\Gamma</M> stored in this package on 
##  <M>n</M> vertices and with index <M>i</M> (the position in which 
##  <M>\Gamma</M> is stored relative to its number of vertices), 
##  <C>CSS_GRAPH_INFO[</C><M>n</M><C>,</C><M>i</M><C>]</C> contains a list
##  with the following entries:
##  <Enum>
##    <Item>The diameter of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphDiameter"/>).</Item>
##    <Item>The girth of the <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphUndirectedGirth"/>).</Item>
##    <Item>The bipartiteness of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="IsBipartiteDigraph"/>).</Item>
##    <Item>The arc-transitiveness of <M>\Gamma</M>
##          (<Ref Prop="IsArcTransitiveDigraph"/>).</Item>   
##    <Item>The type of the automorphism group of <M>\Gamma</M>
##           (TODO function and definition ref).</Item>
##  </Enum>
##    <Example>
##      <![CDATA[
##gap> CSS_GRAPH_INFO[8];
##TODO
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable( "CSS_GRAPH_INFO" );

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  CubicATGraphId( <digraph> )
##  
##  <#GAPDoc Label="CubicATGraphId">
##  <ManSection>
##  <Attr Name="CubicATGraphId"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if <A>gamma</A> is isomorphic to a cubic 
##  arc-transitive graph stored in this package, this function returns the index
##  of the graph isomorphic to <A>gamma</A>. Otherwise, this function returns 
##  <K>fail</K>.
##  <P/>
##  The index <C>i</C> of a cubic arc-transitive graph <C>gamma</C> in this 
##  library is the position at which the graph is stored relative to its number 
##  of vertices. In particular, if <C>gamma</C> has <C>n</C> vertices, then 
##  <C>gamma</C> will be the <C>i</C>th entry of <C>AllCubicATGraphs(n)</C> and 
##  the <C>i</C>th graph found when iterating through 
##  <C>CubicATGraphIterator(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicATGraph(8192,40);;
##gap> CubicATGraphId(gamma);
##40
##gap> gamma:=PetersenGraph();;
##gap> CubicATGraphId(gamma);
##1
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "CubicATGraphId", IsDigraph );

################################################################################
##
#A  CubicSSGraphId( <digraph> )
##  
##  <#GAPDoc Label="CubicSSGraphId">
##  <ManSection>
##  <Attr Name="CubicSSGraphId"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if <A>gamma</A> is isomorphic to a cubic 
##  semisymmetric graph stored in this package, this function returns the index 
##  of the graph isomorphic to <A>gamma</A>. Otherwise, this function returns 
##  <K>fail</K>.
##  <P/>
##  The index <C>i</C> of a cubic semisymmetric graph <C>gamma</C> in this 
##  library is the position at which the graph is stored relative to its number 
##  of vertices. In particular, if <C>gamma</C> has <C>n</C> vertices, then 
##  <C>gamma</C> will be the <C>i</C>th entry of <C>AllCubicSSGraphs(n)</C> and 
##  the <C>i</C>th graph found when iterating through 
##  <C>CubicSSGraphIterator(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicSSGraph(6912,20);;
##gap> CubicSSGraphId(gamma);
##20
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "CubicSSGraphId", IsDigraph );

################################################################################
##
#F  SetCubicATGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetCubicATGraphPropsNC">
##  <ManSection>
##  <Func Name="SetCubicATGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A> with respect to the components of the entry of
##  <Ref Var="CAT_GRAPH_INFO"/> with order <A>n</A> and index <A>i</A>. The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetCubicATGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicATGraph(8192,40);;
##gap> SetCubicATGraphPropsNC(gamma,8192,40);
##gap> IsArcTransitiveDigraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetCubicATGraphPropsNC" );

################################################################################
##
#F  SetCubicSSGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetCubicSSGraphPropsNC">
##  <ManSection>
##  <Func Name="SetCubicSSGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A> with respect to the components of the entry of
##  <Ref Var="CSS_GRAPH_INFO"/> with order <A>n</A> and index <A>i</A>. The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetCubicSSGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicSSGraph(6912,20);;
##gap> SetCubicSSGraphPropsNC(gamma,6912,20);
##gap> IsVertexTransitive(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetCubicSSGraphPropsNC" );

################################################################################
##
#F  SetCubicATGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetCubicATGraphProps">
##  <ManSection>
##  <Func Name="SetCubicATGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a cubic 
##  arc-transitive graph stored in this library, this function sets the 
##  properties and attributes of <A>gamma</A> precomputed in this package. 
##  This includes
##  <List>
##  <Item> All properties and attributes found in Subsection
##         <Ref Sect="Precomputed data cet"/>.
##  </Item>
##  <Item><Ref Attr="CubicATGraphId"/>.</Item>
##  <Item> <Ref Prop="IsCubicGraph"/>.</Item>
##  <Item> <Ref BookName="Digraphs" Prop="IsVertexTransitive"/>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteDigraph(4);;
##gap> SetCubicATGraphProps(gamma);
##gap> IsArcTransitiveDigraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetCubicATGraphProps" );

################################################################################
##
#F  SetCubicSSGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetCubicSSGraphProps">
##  <ManSection>
##  <Func Name="SetCubicSSGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a cubic 
##  semisymmetric graph stored in this library, this function sets the 
##  properties and attributes of <A>gamma</A> precomputed in this package. 
##  This includes
##  <List>
##  <Item> All properties and attributes found in Subsection
##         <Ref Sect="Precomputed data cet"/>.
##  </Item>
##  <Item><Ref Attr="CubicSSGraphId"/>.</Item>
##  <Item> <Ref Prop="IsCubicGraph"/>.</Item>
##  <Item> <Ref BookName="Digraphs" Prop="IsVertexTransitive"/>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicSSGraph(6912,25);;
##gap> SetCubicSSGraphProps(gamma);
##gap> IsVertexTransitive(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetCubicSSGraphProps" );

################################################################################
##
#F  NrCubicATGraphs( <integer> )
#F  NumberCubicATGraphs( <integer> )
##  
##  <#GAPDoc Label="NrCubicATGraphs">
##  <ManSection>
##  <Func Name="NrCubicATGraphs"
##   Arg='n'/>
##  <Func Name="NumberCubicATGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  cubic arc-transitive graphs with <A>n</A> vertices stored in this 
##  package.
##  <P/>
##  For any positive integers <M>n</M> up to 1280, the current package stores
##  all cubic arc-transitive graphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrCubicATGraphs(8192);
##93
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrCubicATGraphs" );
DeclareSynonym( "NumberCubicATGraphs", NrCubicATGraphs);

################################################################################
##
#F  NrCubicSSGraphs( <integer> )
#F  NumberCubicSSGraphs( <integer> )
##  
##  <#GAPDoc Label="NrCubicSSGraphs">
##  <ManSection>
##  <Func Name="NrCubicSSGraphs"
##   Arg='n'/>
##  <Func Name="NumberCubicSSGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  cubic semisymmetric graphs with <A>n</A> vertices stored in this 
##  package.
##  <P/>
##  For any positive integers <M>n</M> up to 1280, the current package stores
##  all cubic semisymmetric graphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrCubicSSGraphs(3888);
##35
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrCubicSSGraphs" );
DeclareSynonym( "NumberCubicSSGraphs", NrCubicSSGraphs);

################################################################################
##
#F  CAT_Filename( <integer> )
##  
DeclareGlobalFunction( "CAT_Filename" );

################################################################################
##
#F  CSS_Filename( <integer> )
##  
DeclareGlobalFunction( "CSS_Filename" );

#############################################################################
##
#F  CubicATGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="CubicATGraph">
##  <ManSection>
##  <Func Name="CubicATGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  cubic arc-transitive graph with <A>n</A> vertices available in this 
##  package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicATGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> CubicATGraph(2048,4);
##<immutable symmetric digraph with 2048 vertices, 6144 edges>
##gap> CubicATGraph(2048,26);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CubicATGraph" );

#############################################################################
##
#F  CubicSSGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="CubicSSGraph">
##  <ManSection>
##  <Func Name="CubicSSGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  cubic semisymmetric graph with <A>n</A> vertices available in this 
##  package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicSSGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> CubicSSGraph(4374,10);
##<immutable symmetric digraph with 4374 vertices, 13122 edges>
##gap> CubicSSGraph(4374,30);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CubicSSGraph" );

#############################################################################
##
#F  AllCubicATGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllCubicATGraphs">
##  <ManSection>
##  <Func Name="AllCubicATGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all cubic arc-transitive graphs with <A>n</A> vertices available in this 
##  package. If there are no such graphs, the function returns <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicATGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllCubicATGraphs(3072,true);;
##gap> Length(gammas);
##21
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllCubicATGraphs" );

#############################################################################
##
#F  AllCubicSSGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllCubicSSGraphs">
##  <ManSection>
##  <Func Name="AllCubicSSGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all cubic semisymmetric graphs with <A>n</A> vertices available in this 
##  package. If there are no such graphs, the function returns <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicSSGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllCubicSSGraphs(7680,true);;
##gap> Length(gammas);
##21
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllCubicSSGraphs" );

## TODO Example
#############################################################################
##
#F  CubicATGraphIterator( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="CubicATGraphIterator">
##  <ManSection>
##  <Func Name="CubicATGraphIterator"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all cubic arc-transitive graphs with <A>n</A> vertices available in this 
##  package. If there are such no graphs, the function returns an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicATGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CubicATGraphIterator" );

## TODO Example
#############################################################################
##
#F  CubicSSGraphIterator( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="CubicSSGraphIterator">
##  <ManSection>
##  <Func Name="CubicSSGraphIterator"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all cubic semisymmetric graphs with <A>n</A> vertices available in this 
##  package. If there are such no graphs, the function returns an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetCubicSSGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "CubicSSGraphIterator" );


######################
##    PROPERTIES    ##
######################


#############################################################################
##
#E

