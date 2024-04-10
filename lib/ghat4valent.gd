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
#V  GHAT_4VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="GHAT_4VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="GHAT_4VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all <M>G</M>-half-arc-transitive 4-valent graphs with at 
##  most <M>n</M> vertices. The number of <M>G</M>-half-arc-transitive 4-valent
##  graphs stored for each <M>n</M> is stored in the list 
##  <Ref Var="GHAT_4VALENT_NUMBERS"/>. This variable
##  is currently set to 1000. 
##    <Example>
##      <![CDATA[
##gap> GHAT_4VALENT_ORDER_MAX;
##1000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  GHAT_4VALENT_NUMBERS
##
##  <#GAPDoc Label="GHAT_4VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="GHAT_4VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of <M>G</M>-half-arc-transitive 4-valent 
##  graphs stored in this package
##  <P/>
##  For a positive integer <M>n</M>, 
##  <C>GHAT_4VALENT_NUMBERS[</C><M>n</M><C>]</C> is the number of 
##  <M>G</M>-half-arc-transitive 4-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> GHAT_4VALENT_NUMBERS[40];
##5
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("GHAT_4VALENT_NUMBERS","Number of G-half-arc-transitive 4-valent graphs stored");

#############################################################################
##
#V  GHAT_4VALENT_GRAPH_INFO  
##
##  <#GAPDoc Label="GHAT_4VALENT_GRAPH_INFO">
##  <ManSection>
##  <Var Name="GHAT_4VALENT_GRAPH_INFO"/>
##
##  <Description>
##  This variable stores various properties of the graphs stored in this 
##  package. 
##  <P/>
##  For each graph <M>\Gamma</M> stored in this package on <M>n</M> vertices
##  and with index <M>i</M> (the position in which <M>\Gamma</M> is stored 
##  relative to its number of vertices), 
##  <C>GHAT_4VALENT_GRAPH_INFO[</C><M>n</M><C>,</C><M>i</M><C>]</C> contains a list
##  with the following entries:
##  <Enum>
##    <Item>The girth of the <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="DigraphUndirectedGirth"/>).</Item>
##    <Item>The bipartiteness of <M>\Gamma</M> 
##          (<Ref BookName="Digraphs" Attr="IsBipartiteDigraph"/>).</Item>
##    <Item>The Cayley type of <M>\Gamma</M>
##          (<Ref Attr="CayleyType"/>).</Item>
##    <Item>The size of the stabilizer of a vertex in the automorphism group
##          of <M>\Gamma</M> (<Ref Attr="SizeStabAut"/>).</Item>   
##    <Item>The size of the stabilizer of a vertex in the half-arc-transitive 
##          group of automorphisms of <M>\Gamma</M> 
##          (<Ref Attr="SizeStabGHATGroups"/>).</Item>   
##    <Item>The solvability of the automorphism group of <M>\Gamma</M>
##          (<Ref Prop="HasSolvableAutGroup"/>).</Item>
##    <Item>The consistent cycle types of <M>\Gamma</M>
##          (<Ref Attr="ConsistentCycleTypes"/>).</Item>
##  </Enum>
##    <Example>
##      <![CDATA[
##gap> GHAT_4VALENT_GRAPH_INFO[24];
##[ [ 4, true, "Circ", 4, [ 2, 2, 2 ], true, [ "6s", "8s", "24s" ] ], 
##  [ 4, true, "Circ", 4, [ 2, 2, 2 ], true, [ "8s", "12s", "24s" ] ], 
##  [ 3, false, "Cay", 4, [ 2, 2 ], true, [ "3s", "8s", "12s" ] ], 
##  [ 5, false, "Cay", 4, [ 2, 2 ], true, [ "6s", "8s", "12s" ] ] ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable( "GHAT_4VALENT_GRAPH_INFO" );

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfGHAT4ValentGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfGHAT4ValentGraph">
##  <ManSection>
##  <Attr Name="IdOfGHAT4ValentGraph"
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
##  be the <C>i</C>th entry of <C>AllGHAT4ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfGHAT4ValentGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20);;
##gap> IdOfGHAT4ValentGraph(gamma);
##20
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfGHAT4ValentGraph", IsDigraph );

################################################################################
##
#F  SetGHAT4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetGHAT4ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="SetGHAT4ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A> with respect to the components of the entry of
##  <Ref Var="GHAT_4VALENT_GRAPH_INFO"/> with order <A>n</A> and index <A>i</A>. The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetGHAT4ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20);;
##gap> SetGHAT4ValentGraphPropsNC(gamma,768,20);
##gap> SizeStabAut(gamma);
##4
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetGHAT4ValentGraphPropsNC" );

################################################################################
##
#F  SetGHAT4ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetGHAT4ValentGraphProps">
##  <ManSection>
##  <Func Name="SetGHAT4ValentGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package. This includes
##  <List>
##  <Item> All properties and attributes found in <Ref Var="GHAT_4VALENT_GRAPH_INFO"/>.
##  </Item>
##  <Item> (<Ref Prop="IsCayleyDigraphCVT"/>).</Item>
##  <Item> <Ref BookName="Digraphs" Prop="IsVertexTransitive"/>.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20);;
##gap> SetGHAT4ValentGraphProps(gamma);
##gap> SizeStabAut(gamma);
##4
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetGHAT4ValentGraphProps" );

#############################################################################
##
#F  SmallGHAT4ValentGraphsInfo  
##
##  <#GAPDoc Label="SmallGHAT4ValentGraphsInfo">
##  <ManSection>
##  <Func Name="SmallGHAT4ValentGraphsInfo"
##   Arg='n'/>
##  <Returns></Returns>
##  <Description>
##  Given a positive integer <A>n</A>, this function prints information on the
##  <M>G</M>-half-arc-transitive 4-valent graphs on <A>n</A> vertices currently stored in this
##  package. This includes the total number of graphs, the enumeration status of
##  these graphs, and the number of graphs with several properties 
##  precomputed and stored in this library.
##    <Example>
##      <![CDATA[
##gap> SmallGHAT4ValentGraphsInfo(50);
##  CVT: There are 9 <M>G</M>-half-arc-transitive 4-valent graphs on 50 vertices.
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
# DeclareGlobalFunction( "SmallGHAT4ValentGraphsInfo" );

################################################################################
##
#F  NrGHAT4ValentGraphs( <integer> )
#F  NumberGHAT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="NrGHAT4ValentGraphs">
##  <ManSection>
##  <Func Name="NrGHAT4ValentGraphs"
##   Arg='n'/>
##  <Func Name="NumberGHAT4ValentGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  <M>G</M>-half-arc-transitive 4-valent graphs with <A>n</A> vertices stored 
##  in this package.
##  <P/>
##  For any positive integers <M>n</M> up to 1000, the current package stores
##  all <M>G</M>-half-arc-transitive 4-valent graphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrGHAT4ValentGraphs(600);
##80
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrGHAT4ValentGraphs" );
DeclareSynonym( "NumberGHAT4ValentGraphs", NrGHAT4ValentGraphs);

################################################################################
##
#F  GHAT_4VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "GHAT_4VALENT_Filename" );

#############################################################################
##
#F  GHAT4ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="GHAT4ValentGraph">
##  <ManSection>
##  <Func Name="GHAT4ValentGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  <M>G</M>-half-arc-transitive 4-valent graph with <A>n</A> vertices available
##  in this package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetGHAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> GHAT4ValentGraph(600,20);
##<immutable symmetric digraph with 600 vertices, 2400 edges>
##gap> GHAT4ValentGraph(600,81);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "GHAT4ValentGraph" );

#############################################################################
##
#F  AllGHAT4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllGHAT4ValentGraphs">
##  <ManSection>
##  <Func Name="AllGHAT4ValentGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all <M>G</M>-half-arc-transitive 4-valent graphs with <A>n</A> vertices 
##  available in this package. If there are no such graphs, the function returns
## <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetGHAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllGHAT4ValentGraphs(600);;
##gap> Length(gammas);
##80
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllGHAT4ValentGraphs" );

#############################################################################
##
#F  IteratorOfGHAT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOfGHAT4ValentGraphs">
##  <ManSection>
##  <Func Name="IteratorOfGHAT4ValentGraphs"
##   Arg='n'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all <M>G</M>-half-arc-transitive 4-valent graphs with <A>n</A> vertices 
##  available in this package. If there are such no graphs, the function returns
##  an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetGHAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=IteratorOfGHAT4ValentGraphs(600);;
##gap> for gamma in iter do
##> if HasSolvableAutGroup(gamma) then
##> cnt:=cnt+1;
##> fi;
##> od;
##gap> cnt;
##57
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfGHAT4ValentGraphs" );

######################
##    ATTRIBUTES    ##
######################

################################################################################
##
#A  CayleyType( <digraph> )
##  
##  <#GAPDoc Label="CayleyType">
##  <ManSection>
##  <Attr Name="CayleyType"
##   Arg='gamma'/>
##  <Returns>A string.</Returns>
##	
##  <Description>
##  Given a <M>G</M>-half-arc-transitive 4-valent graph <A>gamma</A> from in the
##  &GRSYLI; package such that its properties and attributes have been assigned, 
##  this function returns the Cayley type of <A>gamma</A>.
##  <P/>
##  Let <M>\Gamma</M> be a graph. Then <C>CayleyType(</C><M>\Gamma</M><C>)</C>
##  takes value as one of the following strings:
##  <List>
##  <Mark>Circ</Mark>
##  <Item>if <M>\Gamma</M> is isomorphic to a circulant graph (a Cayley graph 
##  defined on a cyclic group).</Item>
##  <Mark>AbCay</Mark>
##  <Item>if <M>\Gamma</M> is isomorphic to a Cayley graph defined on an 
##  abelian group, but not isomorphic to a circulant graph.</Item>
##  <Mark>Cay</Mark>
##  <Item>if <M>\Gamma</M> is isomorphic to a Cayley graph defined on a  
##  nonabelian group, but not isomorphic to a Cayley graph defined on an
##  abelian group.</Item>
##  <Mark>n-Cay</Mark>
##  <Item>if <M>\Gamma</M> is not isomorphic to a Cayley graph.</Item>
##  </List>
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20,true);;
##gap> CayleyType(gamma);
##"Cay"
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("CayleyType", IsDigraph);

################################################################################
##
#A  SizeStabAut( <digraph> )
##  
##  <#GAPDoc Label="SizeStabAut">
##  <ManSection>
##  <Attr Name="SizeStabAut"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a <M>G</M>-half-arc-transitive 4-valent graph <A>gamma</A> from in the
##  &GRSYLI; package such that its properties and attributes have been assigned, 
##  this function returns the size of the stabilizer of a vertex in the 
##  automorphism group of <A>gamma</A>.
##  <P/>
##  The properties and attributes of a <M>G</M>-half-arc-transitive 4-valent 
##  graph that can be found in the &GRSYLI; package can be assigned using the 
##  function <Ref Func="SetGHAT4ValentGraphProps"/>, or loaded automatically by 
##  the functions <Ref Func="GHAT4ValentGraph"/>, 
##  <Ref Func="AllGHAT4ValentGraphs"/> or 
##  <Ref Func="IteratorOfGHAT4ValentGraphs"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20,true);;
##gap> SizeStabAut(gamma);
##4
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("SizeStabAut", IsDigraph);

################################################################################
##
#A  SizeStabGHATGroups( <digraph> )
##  
##  <#GAPDoc Label="SizeStabGHATGroups">
##  <ManSection>
##  <Attr Name="SizeStabGHATGroups"
##   Arg='gamma'/>
##  <Returns>A list.</Returns>
##	
##  <Description>
##  Given a <M>G</M>-half-arc-transitive 4-valent graph <A>gamma</A> from in the &GRSYLI; 
##  package such that its properties and attributes have been assigned, 
##  this function returns a list containing the size of the stabilizer of a 
##  vertex in each maximal group <M>H</M> for which <A>gamma</A> is  
##  <M>H</M>-half-arc-transitive.
##  <P/>
##  The properties and attributes of a <M>G</M>-half-arc-transitive 4-valent graph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetGHAT4ValentGraphProps"/>, or loaded automatically by the functions
##  <Ref Func="GHAT4ValentGraph"/>, <Ref Func="AllGHAT4ValentGraphs"/> or 
##  <Ref Func="IteratorOfGHAT4ValentGraphs"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20,true);;
##gap> SizeStabGHATGroups(gamma);
##[ 2, 2, 2 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("SizeStabGHATGroups", IsDigraph);

################################################################################
##
#A  ConsistentCycleTypes( <digraph> )
##  
##  <#GAPDoc Label="ConsistentCycleTypes">
##  <ManSection>
##  <Attr Name="ConsistentCycleTypes"
##   Arg='gamma'/>
##  <Returns>A list.</Returns>
##	
##  <Description>
##  Given a <M>G</M>-half-arc-transitive 4-valent graph <A>gamma</A> from in the &GRSYLI; 
##  package such that its properties and attributes have been assigned, 
##  this function returns the list of consistent cycle types of the graph <A>gamma</A>. 
##  For a <M>G</M>-consistent cycle <C>C</C> in <A>gamma</A>, the consistent 
##  cycle type of <C>C</C> is denoted as a string, starting with length of
##  <C>C</C>, and with last character <C>s</C> if <C>C</C> is <M>G</M>-symmetric,
##  or <C>c</C> if <C>C</C> is <M>G</M>-chiral.
##  <P/>
##  The properties and attributes of a <M>G</M>-half-arc-transitive 4-valent graph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetGHAT4ValentGraphProps"/>, or loaded automatically by the functions
##  <Ref Func="GHAT4ValentGraph"/>, <Ref Func="AllGHAT4ValentGraphs"/> or 
##  <Ref Func="IteratorOfGHAT4ValentGraphs"/>.
##  <P/>
##  Let <M>\Gamma</M> be a graph with group of automorphisms <M>G</M>, and cycle 
##  <M>C</M>. The cycle <M>C</M> is <M>G</M><E>-consistent</E> if there is an 
##  element of <M>G</M> which induces a 1-step rotation on <M>C</M>. A 
##  <M>G</M>-consistent cycle <M>C</M> is <M>G</M><E>-symmetric</E> if there is
##  an element of <M>G</M> which reverses the orientation of <M>C</M>. A 
##  <M>G</M>-consistent cycle <M>C</M> is <M>G</M><E>-chiral</E> if there is
##  no element of <M>G</M> which reverses the orientation of <M>C</M>. For 
##  information and references on consistent cycles, see <Cite Key="PSV_2013a"/>.
##   
##    <Example>
##      <![CDATA[
##gap> gamma:=GHAT4ValentGraph(768,20,true);;
##gap> ConsistentCycleTypes(gamma);
##[ "4s", "6s", "12s" ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("ConsistentCycleTypes", IsDigraph);

#############################################################################
##
#E

