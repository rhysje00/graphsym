#############################################################################
##
#W    utils.gd      GRaphs with SYmmetries library           Rhys J. Evans
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
#V  HAT_4VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="HAT_4VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="HAT_4VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all half-arc-transitive 4-valent graphs with at 
##  most <M>n</M> vertices. The number of half-arc-transitive 4-valent
##  graphs stored for each <M>n</M> is stored in the list 
##  <Ref Var="HAT_4VALENT_NUMBERS"/>. This variable
##  is currently set to 1000. 
##    <Example>
##      <![CDATA[
##gap> HAT_4VALENT_ORDER_MAX;
##1000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  HAT_4VALENT_NUMBERS
##
##  <#GAPDoc Label="HAT_4VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="HAT_4VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of half-arc-transitive 4-valent 
##  graphs stored in this package
##  <P/>
##  For a positive integer <M>n</M>, 
##  <C>HAT_4VALENT_NUMBERS[</C><M>n</M><C>]</C> is the number of 
##  half-arc-transitive 4-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> Maximum(HAT_4VALENT_NUMBERS);
##185
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("HAT_4VALENT_NUMBERS","Number of half-arc-transitive 4-valent graphs stored");

#############################################################################
##
#V  HAT_4VALENT_GRAPH_INFO  
##
##  <#GAPDoc Label="HAT_4VALENT_GRAPH_INFO">
##  <ManSection>
##  <Var Name="HAT_4VALENT_GRAPH_INFO"/>
##
##  <Description>
##  This variable stores various properties of the graphs stored in this 
##  package. 
##  <P/>
##  For each graph <M>\Gamma</M> stored in this package on <M>n</M> vertices
##  and with index <M>i</M> (the position in which <M>\Gamma</M> is stored 
##  relative to its number of vertices), 
##  <C>HAT_4VALENT_GRAPH_INFO[</C><M>n</M><C>,</C><M>i</M><C>]</C> contains a list
##  with the following entries:
##  <Enum>
##    <Item>The girth of the <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphUndirectedGirth"/>).</Item>
##    <Item>The bipartiteness of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="IsBipartiteDigraph"/>).</Item>
##    <Item>The Cayleyness of <M>\Gamma</M>
##          (<Ref Prop="IsCayleyDigraphCVT"/>).</Item>
##    <Item>The size of the stabilizer of a vertex in the automorphism group
##          of <M>\Gamma</M> (<Ref Attr="SizeStabAut"/>).</Item>   
##    <Item>The solvability of the automorphism group of <M>\Gamma</M>
##          (<Ref Prop="HasSolvableAutGroup"/>).</Item>
##    <Item>The radius of <M>\Gamma</M> 
##          (see <Ref Attr="AlterCycleRadius"/>).</Item>
##    <Item>The attachment number of <M>\Gamma</M> 
##          (see <Ref Attr="AlterCycleAttachmentNo"/>).</Item>
##    <Item>The attachment type of <M>\Gamma</M> 
##          (see <Ref Attr="AlterCycleAttachmentType"/>).</Item>
##    <Item>The alter-exponent of <M>\Gamma</M> 
##          (see <Ref Attr="AlterExponent"/>).</Item>
##    <Item>The alter-perimeter of <M>\Gamma</M> 
##          (see <Ref Attr="AlterPerimeter"/>).</Item>
##    <Item>The alter-sequence of <M>\Gamma</M> 
##          (see <Ref Attr="AlterSequence"/>).</Item>
##    <Item>The length of the shortest consistent cycle in <M>\Gamma</M> 
##          (see <Ref Attr="ConsistentCycleTypes"/>).</Item>
##    <Item>The length of the longest consistent cycle in <M>\Gamma</M> 
##          (see <Ref Attr="ConsistentCycleTypes"/>).</Item>
##    <Item>The meta-cirulant types of <M>\Gamma</M> 
##          (see <Ref Attr="HAT4ValentMetaCirculantClasses"/>).</Item>
##  </Enum>
##    <Example>
##      <![CDATA[
##gap> HAT_4VALENT_GRAPH_INFO[27];
##[ [ 5, false, true, 2, true, 9, 9, "tight", 1, 3, [ 9 ], 6, 9, [ 1, 2 ] ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable( "HAT_4VALENT_GRAPH_INFO" );

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfHAT4ValentGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfHAT4ValentGraph">
##  <ManSection>
##  <Attr Name="IdOfHAT4ValentGraph"
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
##  be the <C>i</C>th entry of <C>AllHAT4ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfHAT4ValentGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=HAT4ValentGraph(768,20);;
##gap> IdOfHAT4ValentGraph(gamma);
##20
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfHAT4ValentGraph", IsDigraph );

################################################################################
##
#F  SetHAT4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetHAT4ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="SetHAT4ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A> with respect to the components of the entry of
##  <Ref Var="HAT_4VALENT_GRAPH_INFO"/> with order <A>n</A> and index <A>i</A>. The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetHAT4ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=HAT4ValentGraph(768,20);;
##gap> SetHAT4ValentGraphPropsNC(gamma,768,20);
##gap> SizeStabAut(gamma);
##8
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetHAT4ValentGraphPropsNC" );

################################################################################
##
#F  SetHAT4ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetHAT4ValentGraphProps">
##  <ManSection>
##  <Func Name="SetHAT4ValentGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package. This includes
##  <List>
##  <Item> All properties and attributes found in <Ref Var="HAT_4VALENT_GRAPH_INFO"/>.
##  </Item>
##  <Item> (<Ref Prop="IsCayleyDigraphCVT"/>).</Item>
##  <Item> <Ref BookName="Digraphs" Prop="IsVertexTransitive"/>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=HAT4ValentGraph(768,20);;
##gap> SetHAT4ValentGraphProps(gamma);
##gap> SizeStabAut(gamma);
##8
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetHAT4ValentGraphProps" );

#############################################################################
##
#F  SmallHAT4ValentGraphsInfo  
##
##  <#GAPDoc Label="SmallHAT4ValentGraphsInfo">
##  <ManSection>
##  <Func Name="SmallHAT4ValentGraphsInfo"
##   Arg='n'/>
##  <Returns></Returns>
##  <Description>
##  Given a positive integer <A>n</A>, this function prints information on the
##  half-arc-transitive 4-valent graphs on <A>n</A> vertices currently stored in this
##  package. This includes the total number of graphs, the enumeration status of
##  these graphs, and the number of graphs with several properties 
##  precomputed and stored in this library.
##    <Example>
##      <![CDATA[
##gap> SmallHAT4ValentGraphsInfo(50);
##  CVT: There are 9 half-arc-transitive 4-valent graphs on 50 vertices.
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
# DeclareGlobalFunction( "SmallHAT4ValentGraphsInfo" );

################################################################################
##
#F  NrHAT4ValentGraphs( <integer> )
#F  NumberHAT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="NrHAT4ValentGraphs">
##  <ManSection>
##  <Func Name="NrHAT4ValentGraphs"
##   Arg='n'/>
##  <Func Name="NumberHAT4ValentGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  half-arc-transitive 4-valent graphs with <A>n</A> vertices stored 
##  in this package.
##  <P/>
##  For any positive integers <M>n</M> up to 1000, the current package stores
##  all half-arc-transitive 4-valent graphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrHAT4ValentGraphs(600);
##27
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrHAT4ValentGraphs" );
DeclareSynonym( "NumberAllHAT4ValentGraphs", NrHAT4ValentGraphs);

################################################################################
##
#F  HAT_4VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "HAT_4VALENT_Filename" );

#############################################################################
##
#F  HAT4ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="HAT4ValentGraph">
##  <ManSection>
##  <Func Name="HAT4ValentGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  half-arc-transitive 4-valent graph with <A>n</A> vertices available
##  in this package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetHAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> HAT4ValentGraph(600,20);
##<immutable symmetric digraph with 600 vertices, 2400 edges>
##gap> HAT4ValentGraph(600,28);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "HAT4ValentGraph" );

#############################################################################
##
#F  AllHAT4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllHAT4ValentGraphs">
##  <ManSection>
##  <Func Name="AllHAT4ValentGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all half-arc-transitive 4-valent graphs with <A>n</A> vertices 
##  available in this package. If there are no such graphs, the function returns
## <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetHAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllHAT4ValentGraphs(600);;
##gap> Length(gammas);
##27
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllHAT4ValentGraphs" );

#############################################################################
##
#F  IteratorOfHAT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOfHAT4ValentGraphs">
##  <ManSection>
##  <Func Name="IteratorOfHAT4ValentGraphs"
##   Arg='n'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all half-arc-transitive 4-valent graphs with <A>n</A> vertices 
##  available in this package. If there are such no graphs, the function returns
##  an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetHAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=IteratorOfHAT4ValentGraphs(600);;
##gap> for gamma in iter do
##> if HasSolvableAutGroup(gamma) then
##> cnt:=cnt+1;
##> fi;
##> od;
##gap> cnt;
##25
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfHAT4ValentGraphs" );

######################
##    ATTRIBUTES    ##
######################

################################################################################
##
#A  HAT4ValentMetaCirculantClasses( <digraph> )
##  
##  <#GAPDoc Label="HAT4ValentMetaCirculantClasses">
##  <ManSection>
##  <Attr Name="HAT4ValentMetaCirculantClasses"
##   Arg='gamma'/>
##  <Returns>A list.</Returns>
##	
##  <Description>
##  Given a half-arc-transitive 4-valent graph <A>gamma</A> from in the
##  &GRSYLI; package such that its properties and attributes have been assigned, 
##  this function returns the meta-circulant classes of <A>gamma</A>.
##  <P/>
##  Let <M>\Gamma</M> be a graph. Then the graph <M>\Gamma</M> is 
##  <E>meta-circulant</E> if the automorphism group of <M>\Gamma</M> has 
##  metacycli subgroup generated by <M>\rho,\sigma</M> such that 
##  <M>\langle \rho\rangle</M> acts semiregularly on the vertices of 
##  <M>\Gamma</M>. Any half-arc-transitive 4-valent graph could fall into 
##  one of four known classes. 
##  <P/>
##  For information and references on these classes, see <Cite Key="PSV_2013a"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=HAT4ValentGraph(768,104,true);;
##gap> HAT4ValentMetaCirculantClasses(gamma);
##[ 2, 4 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("HAT4ValentMetaCirculantClasses", IsDigraph);

#############################################################################
##
#E

