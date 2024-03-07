#############################################################################
##
#W    utils.gd    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the locally arc-transitive 
##  {3,4}-valent graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  LAT_34VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="LAT_34VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="LAT_34VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all arc-transitive 2-valent digraphs with at most <M>n</M> 
##  vertices. The number of arc-transitive 2-valent digraphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="LAT_34VALENT_NUMBERS"/>. This variable
##  is currently set to 1050. 
##    <Example>
##      <![CDATA[
##gap> LAT_34VALENT_ORDER_MAX;
##1050
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  LAT_34VALENT_NUMBERS  
##
##  <#GAPDoc Label="LAT_34VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="LAT_34VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of arc-transitive 2-valent digraphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>LAT_34VALENT_NUMBERS[</C><M>n</M><C>]</C> is the
##  number of arc-transitive 2-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> Maximum(LAT_34VALENT_NUMBERS);
##249
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("LAT_34VALENT_NUMBERS","Number of arc-transitive 2-valent digraphs stored");

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfLAT34ValentGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfLAT34ValentGraph">
##  <ManSection>
##  <Attr Name="IdOfLAT34ValentGraph"
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
##   be the <C>i</C>th entry of <C>AllLAT34ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfLAT34ValentGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=LAT34ValentGraph(896,20);;
##gap> IdOfLAT34ValentGraph(gamma);
##20
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfLAT34ValentGraph", IsDigraph );

################################################################################
##
#F  SetLAT34ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetLAT34ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="SetLAT34ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A>.
#
##  The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetLAT34ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=LAT34ValentGraph(896,20);;
##gap> SetLAT34ValentGraphPropsNC(gamma,896,20);
##gap> IdOfLAT34ValentGraph(gamma);
##20
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetLAT34ValentGraphPropsNC" );

################################################################################
##
#F  SetLAT34ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetLAT34ValentGraphProps">
##  <ManSection>
##  <Func Name="SetLAT34ValentGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package.
##    <Example>
##      <![CDATA[
##gap> gamma:=LAT34ValentGraph(896,20);;
##gap> SetLAT34ValentGraphProps(gamma);
##gap> IdOfLAT34ValentGraph(gamma);
##20
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetLAT34ValentGraphProps" );

################################################################################
##
#F  NrLAT34ValentGraphs( <integer> )
#F  NumberLAT34ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="NrLAT34ValentGraphs">
##  <ManSection>
##  <Func Name="NrLAT34ValentGraphs"
##   Arg='n'/>
##  <Func Name="NumberLAT34ValentGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  arc-transitive 2-valent digraphs with <A>n</A> vertices stored in this 
##  package.
##  <P/>
##  For any positive integers <M>n</M> up to 1000, the current package stores
##  all arc-transitive 2-valent digraphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrLAT34ValentGraphs(896);
##249
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrLAT34ValentGraphs" );
DeclareSynonym( "NumberLAT34ValentGraphs", NrLAT34ValentGraphs);

################################################################################
##
#F  LAT_34VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "LAT_34VALENT_Filename" );

#############################################################################
##
#F  LAT34ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="LAT34ValentGraph">
##  <ManSection>
##  <Func Name="LAT34ValentGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  arc-transitive 2-valent digraph with <A>n</A> vertices available in this 
##  package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetLAT34ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> LAT34ValentGraph(896,200);
##<immutable symmetric digraph with 896 vertices, 3072 edges>
##gap> LAT34ValentGraph(896,300);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "LAT34ValentGraph" );

#############################################################################
##
#F  AllLAT34ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllLAT34ValentGraphs">
##  <ManSection>
##  <Func Name="AllLAT34ValentGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all arc-transitive digraphs with <A>n</A> vertices available in this 
##  package. If there are no such graphs, the function returns <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetLAT34ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllLAT34ValentGraphs(224);;
##gap> Length(gammas);
##22
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllLAT34ValentGraphs" );

#############################################################################
##
#F  IteratorOfLAT34ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOfLAT34ValentGraphs">
##  <ManSection>
##  <Func Name="IteratorOfLAT34ValentGraphs"
##   Arg='n'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all arc-transitive 2-valent digraphs with <A>n</A> vertices available in this 
##  package. If there are such no graphs, the function returns an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetLAT34ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=IteratorOfLAT34ValentGraphs(224);;
##gap> for gamma in iter do
##> if HasSolvableAutGroup(gamma) then
##> cnt:=cnt+1;
##> fi;
##> od;
##gap> cnt;
##22
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfLAT34ValentGraphs" );

#############################################################################
##
#E

