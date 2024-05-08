#############################################################################
##
#W    utils.gd    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the arc-transitive 4-valent
##  graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  ET_4VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="ET_4VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="ET_4VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all arc-transitive 2-valent digraphs with at most <M>n</M> 
##  vertices. The number of arc-transitive 2-valent digraphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="ET_4VALENT_NUMBERS"/>. This variable
##  is currently set to 512. 
##    <Example>
##      <![CDATA[
##gap> ET_4VALENT_ORDER_MAX;
##640
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  ET_4VALENT_NUMBERS  
##
##  <#GAPDoc Label="ET_4VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="ET_4VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of arc-transitive 2-valent digraphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>ET_4VALENT_NUMBERS[</C><M>n</M><C>]</C> is the
##  number of arc-transitive 2-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> Maximum(ET_4VALENT_NUMBERS);
##664
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("ET_4VALENT_NUMBERS","Number of arc-transitive 2-valent digraphs stored");

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  ET4ValentGraphId( <digraph> )
##  
##  <#GAPDoc Label="ET4ValentGraphId">
##  <ManSection>
##  <Attr Name="ET4ValentGraphId"
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
##   be the <C>i</C>th entry of <C>AllET4ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>ET4ValentGraphIterator(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CompleteDigraph(5);;
##gap> ET4ValentGraphId(gamma);
##1
##gap> gamma:=ET4ValentGraph(512,40);;
##gap> ET4ValentGraphId(gamma);
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "ET4ValentGraphId", IsDigraph );

################################################################################
##
#F  SetET4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetET4ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="SetET4ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A>.
#
##  The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetET4ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=ET4ValentGraph(512,40);;
##gap> SetET4ValentGraphPropsNC(gamma,512,40);
##gap> ET4ValentGraphId(gamma);
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetET4ValentGraphPropsNC" );

################################################################################
##
#F  SetET4ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetET4ValentGraphProps">
##  <ManSection>
##  <Func Name="SetET4ValentGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package. This includes:
##  <List>
##  <Item><Ref Attr="ET4ValentGraphId"/>.</Item>
##  </List>  
##    <Example>
##      <![CDATA[
##gap> gamma:=ET4ValentGraph(512,40);;
##gap> SetET4ValentGraphProps(gamma);
##gap> ET4ValentGraphId(gamma);
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetET4ValentGraphProps" );

################################################################################
##
#F  NrET4ValentGraphs( <integer> )
#F  NumberET4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="NrET4ValentGraphs">
##  <ManSection>
##  <Func Name="NrET4ValentGraphs"
##   Arg='n'/>
##  <Func Name="NumberET4ValentGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer.</Returns>
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
##gap> NrET4ValentGraphs(400);
##107
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrET4ValentGraphs" );
DeclareSynonym( "NumberET4ValentGraphs", NrET4ValentGraphs);

################################################################################
##
#F  ET_4VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "ET_4VALENT_Filename" );

#############################################################################
##
#F  ET4ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="ET4ValentGraph">
##  <ManSection>
##  <Func Name="ET4ValentGraph"
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
##  and attributes from <Ref Func="SetET4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> ET4ValentGraph(512,100);
##<immutable symmetric digraph with 512 vertices, 2048 edges>
##gap> ET4ValentGraph(512,700);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ET4ValentGraph" );

#############################################################################
##
#F  AllET4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllET4ValentGraphs">
##  <ManSection>
##  <Func Name="AllET4ValentGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list.</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all arc-transitive digraphs with <A>n</A> vertices available in this 
##  package. If there are no such graphs, the function returns <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetET4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllET4ValentGraphs(400);;
##gap> Length(gammas);
##107
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllET4ValentGraphs" );

#############################################################################
##
#F  ET4ValentGraphIterator( <integer> )
##  
##  <#GAPDoc Label="ET4ValentGraphIterator">
##  <ManSection>
##  <Func Name="ET4ValentGraphIterator"
##   Arg='n[, data]'/>
##  <Returns>An iterator.</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all arc-transitive 2-valent digraphs with <A>n</A> vertices available in this 
##  package. If there are such no graphs, the function returns an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetET4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=ET4ValentGraphIterator(400);;
##gap> for gamma in iter do
##> if HasSolvableAutGroup(gamma) then
##> cnt:=cnt+1;
##> fi;
##> od;
##gap> cnt;
##106
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "ET4ValentGraphIterator" );

#############################################################################
##
#E

