#############################################################################
##
#W    utils.gd    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the arc-transitive 2-valent
##  digraphs 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  ATD_2VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="ATD_2VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="ATD_2VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all arc-transitive 2-valent digraphs with at most <M>n</M> 
##  vertices. The number of arc-transitive 2-valent digraphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="ATD_2VALENT_NUMBERS"/>. This variable
##  is currently set to 1000. 
##    <Example>
##      <![CDATA[
##gap> ATD_2VALENT_ORDER_MAX;
##1000
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  ATD_2VALENT_NUMBERS  
##
##  <#GAPDoc Label="ATD_2VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="ATD_2VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of arc-transitive 2-valent digraphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>ATD_2VALENT_NUMBERS[</C><M>n</M><C>]</C> is the
##  number of arc-transitive 2-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> ATD_2VALENT_NUMBERS[1000];  
##182
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("ATD_2VALENT_NUMBERS","Number of arc-transitive 2-valent digraphs stored");

#############################################################################
##
#V  ATD_2VALENT_INFO  
##
##  <#GAPDoc Label="ATD_2VALENT_INFO">
##  <ManSection>
##  <Var Name="ATD_2VALENT_INFO"/>
##
##  <Description>
##  This variable stores various properties of the arc-transitive 2-valent 
##  digraphs stored in this 
##  package. 
##  <P/>
##  For each digraph <M>\Gamma</M> stored in this package on <M>n</M> vertices
##  and with index <M>i</M> (the position in which <M>\Gamma</M> is stored 
##  relative to its number of vertices), 
##  <C>ATD_2VALENT_INFO[</C><M>n</M><C>,</C><M>i</M><C>]</C> contains a list
##  with the following entries:
##  <Enum>
##    <Item>The self-oppositeness of <M>\Gamma</M> 
##          (see <Ref Prop="IsSelfOppositeDigraph"/>).</Item>
##    <Item>The index of the opposite graph of <M>\Gamma</M> 
##          (see <Ref Attr="IdOfOppositeDigraph"/>).</Item>
##    <Item>The arc-transitiveness of the underlying graph of <M>\Gamma</M> 
##          (see <Ref Prop="HasATUnderlyingGraph"/>).</Item>
##    <Item>The underlying graph of <M>\Gamma</M>. This is a string giving 
##          the position of the underlying graph in the list of GWG graphs 
##          GHAT graphs or HAT graphs 
##          (see <Ref Attr="NameOfUnderlyingGraph"/>).</Item>
##    <Item>The maximum <M>s</M> such that <M>\Gamma</M> is 
##          <M>s</M>-arc-transitive 
##          (see <Ref Attr="MaximumArcTransitiveness"/>).</Item>   
##    <Item>The abelian-ness of a vertex stabiliser of <M>\Gamma</M> 
##          (see <Ref Prop="HasAbelianVertexStabilizer"/>).</Item>
##    <Item><M>|T_v:G_v|</M> of a vertex of <M>\Gamma</M> 
##          (see <Ref Attr="StabIndexMinATUnd"/>).</Item>
##    <Item><M>|A_v:G_v|</M> of a vertex of <M>\Gamma</M> 
##          (see <Ref Attr="StabIndexUnd"/>).</Item>
##    <Item>The solvability of the automorphism group of <M>\Gamma</M>
##           (see <Ref Prop="HasSolvableAutGroup"/>).</Item>
##    <Item>The radius of <M>\Gamma</M> 
##          (see <Ref Attr="ATD2ValentRadius"/>).</Item>
##    <Item>The attachment number of <M>\Gamma</M> 
##          (see <Ref Attr="ATD2ValentAttachmentNo"/>).</Item>
##    <Item>Then attachment type of <M>\Gamma</M> 
##          (see <Ref Attr="ATD2ValentAttachmentType"/>).</Item>
##    <Item>The number of alternating cycles in <M>\Gamma</M> 
##          (see <Ref Attr="DigraphNrAlterCycles"/>).</Item>
##    <Item>The alter-exponent of <M>\Gamma</M> 
##          (see <Ref Attr="DigraphAlterExponent"/>).</Item>
##    <Item>The alter-perimeter of <M>\Gamma</M> 
##          (see <Ref Attr="DigraphAlterPerimeter"/>).</Item>
##    <Item>The alter-sequence of <M>\Gamma</M> 
##          (see <Ref Attr="DigraphAlterSequence"/>).</Item>
##    <Item>The generalised wreath digraph-ness of <M>\Gamma</M> 
##          (see <Ref Prop="IsGeneralizedWreathDigraph"/>).</Item>
##  </Enum>
##    <Example>
##      <![CDATA[
##gap> ATD_2VALENT_INFO[8,1];
##[ true, 1, true, "GWG(4;1)", 1, true, 2, 72, true, 4, 8, "---", 2, 1, 2, 
##  [ 4 ], false ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable( "ATD_2VALENT_INFO" );


######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfAT2ValentDigraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfAT2ValentDigraph">
##  <ManSection>
##  <Attr Name="IdOfAT2ValentDigraph"
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
##   be the <C>i</C>th entry of <C>AllAT2ValentDigraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfAT2ValentDigraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(100,5);;
##gap> IdOfAT2ValentDigraph(gamma);
##5
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfAT2ValentDigraph", IsDigraph );

################################################################################
##
#F  SetAT2ValentDigraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetAT2ValentDigraphPropsNC">
##  <ManSection>
##  <Func Name="SetAT2ValentDigraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A>.
#
##  The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(150,5);;
##gap> SetAT2ValentDigraphPropsNC(gamma,150,5);
##gap> IsGeneralizedWreathDigraph(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetAT2ValentDigraphPropsNC" );

################################################################################
##
#F  SetAT2ValentDigraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetAT2ValentDigraphProps">
##  <ManSection>
##  <Func Name="SetAT2ValentDigraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package.
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(150,5);;
##gap> SetAT2ValentDigraphProps(gamma);
##gap> IsGeneralizedWreathDigraph(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetAT2ValentDigraphProps" );

################################################################################
##
#F  NrAT2ValentDigraphs( <integer> )
#F  NumberAT2ValentDigraphs( <integer> )
##  
##  <#GAPDoc Label="NrAT2ValentDigraphs">
##  <ManSection>
##  <Func Name="NrAT2ValentDigraphs"
##   Arg='n'/>
##  <Func Name="NumberAT2ValentDigraphs"
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
##gap> NrAT2ValentDigraphs(500);
##63
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrAT2ValentDigraphs" );
DeclareSynonym( "NumberAT2ValentDigraphs", NrAT2ValentDigraphs);

################################################################################
##
#F  ATD_2valent_Filename( <integer> )
##  
DeclareGlobalFunction( "ATD_2valent_Filename" );

#############################################################################
##
#F  AT2ValentDigraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AT2ValentDigraph">
##  <ManSection>
##  <Func Name="AT2ValentDigraph"
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
##  and attributes from <Ref Func="SetAT2ValentDigraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> AT2ValentDigraph(300,40);
##<immutable digraph with 300 vertices, 600 edges>
##gap> AT2ValentDigraph(300,100);
##fail
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AT2ValentDigraph" );

#############################################################################
##
#F  AllAT2ValentDigraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllAT2ValentDigraphs">
##  <ManSection>
##  <Func Name="AllAT2ValentDigraphs"
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
##  and attributes from <Ref Func="SetAT2ValentDigraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllAT2ValentDigraphs(300,true);;
##gap> ForAny(gammas,HasAbelianVertexStabilizer);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllAT2ValentDigraphs" );

#############################################################################
##
#F  IteratorOfAT2ValentDigraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOfAT2ValentDigraphs">
##  <ManSection>
##  <Func Name="IteratorOfAT2ValentDigraphs"
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
##  and attributes from <Ref Func="SetAT2ValentDigraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> cnt:=0;; iter:=IteratorOfAT2ValentDigraphs(100,true);;
##gap> for gamma in iter do
##> if HasSolvableAutGroup(gamma) then
##> cnt:=cnt+1;
##> fi;
##> od;
##gap> cnt;
##15
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfAT2ValentDigraphs" );


######################
##    PROPERTIES    ##
######################

################################################################################
##
#P  IsSelfOppositeDigraph( <digraph> )
##  
##  <#GAPDoc Label="IsSelfOppositeDigraph">
##  <ManSection>
##  <Prop Name="IsSelfOppositeDigraph"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function returns <K>true</K> if
##  <A>gamma</A> is isomorphic to the opposite (or reverse) of <A>gamma</A>,
##  and otherwise it returns <K>false</K> 
##  (see <Ref BookName="Digraphs" Attr="DigraphReverse"/> ).
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(300,1);;
##gap> IsSelfOppositeDigraph(gamma);
##false
##gap> gamma:=AT2ValentDigraph(300,20);;
##gap> IsSelfOppositeDigraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsSelfOppositeDigraph", IsDigraph);

################################################################################
##
#P  HasATUnderlyingGraph( <digraph> )
##  
##  <#GAPDoc Label="HasATUnderlyingGraph">
##  <ManSection>
##  <Prop Name="HasATUnderlyingGraph"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function returns <K>true</K> if
##  the underlying graph of <A>gamma</A> is arc-transitive, 
##  and otherwise it returns <K>false</K> (see
##   <Ref BookName="Digraphs" Attr="DigraphSymmetricClosure"/>, 
##   <Ref BookName="Digraphs" Attr="IsEdgeTransitive"/> and
##   <Ref Prop="IsArcTransitiveDigraph"/>).
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(300,10);;
##gap> HasATUnderlyingGraph(gamma);
##false
##gap> gamma:=AT2ValentDigraph(300,30,true);;
##gap> HasATUnderlyingGraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("HasATUnderlyingGraph", IsDigraph);

################################################################################
##
#P  HasAbelianVertexStabilizer( <digraph> )
##  
##  <#GAPDoc Label="HasAbelianVertexStabilizer">
##  <ManSection>
##  <Prop Name="HasAbelianVertexStabilizer"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function returns <K>true</K> if
##  the stabilizer of a vertex in the automorphism group of <A>gamma</A> is 
##  abelian, and otherwise it returns <K>false</K>.
##    <Example>
##      <![CDATA[
##gap> gammas:=AllAT2ValentDigraphs(700,true);;
##gap> ForAll(gammas,HasAbelianVertexStabilizer);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("HasAbelianVertexStabilizer", IsDigraph);

################################################################################
##
#P  IsGeneralizedWreathDigraph( <digraph> )
##  
##  <#GAPDoc Label="IsGeneralizedWreathDigraph">
##  <ManSection>
##  <Prop Name="IsGeneralizedWreathDigraph"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns <K>true</K> if it is isomorphic to a generalized 
##  wreath digraph, and otherwise it returns <K>false</K>. 
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  Let <M>n</M> be an integer such that <M>n&gt;2</M>. The 
##  <E>generalized wreath digraph</E>, <M>&Warw;_n</M>, has vertex-set 
##  <M>&ZZ;_n \times &ZZ;_2</M>. Then, two distinct vertices <M>(i,a),(j,b)</M> are 
##  adjacent if and only if <M>j-i\equiv 1 \pmod n</M>.  
##  <P/>
##  For more information on the generalized wreath digraphs, see 
##  <Cite Key="PSV_2015"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(700,30,true);;
##gap> IsGeneralizedWreathDigraph(gamma);
##false
##gap> gamma:=AT2ValentDigraph(700,43,true);;
##gap> IsGeneralizedWreathDigraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsGeneralizedWreathDigraph", IsDigraph);

######################
##    ATTRIBUTES    ##
######################

################################################################################
##
#A  IdOfOppositeDigraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfOppositeDigraph">
##  <ManSection>
##  <Attr Name="IdOfOppositeDigraph"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the position, <C>i</C>, at which the opposite 
##  (or reverse) of <A>gamma</A> is stored 
##  (see  <Ref BookName="Digraphs" Attr="DigraphReverse"/>). 
##  In particular, if <A>gamma</A> has order <M>n</M>, then 
##  <C>AT2ValentDigraph(</C><M>n</M><C>,i)</C> is the opposite graph of 
##  <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(700,10,true);;
##gap> IdOfOppositeDigraph(gamma);
##9
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("IdOfOppositeDigraph", IsDigraph);

################################################################################
##
#A  NameOfUnderlyingGraph( <digraph> )
##  
##  <#GAPDoc Label="NameOfUnderlyingGraph">
##  <ManSection>
##  <Attr Name="NameOfUnderlyingGraph"
##   Arg='gamma'/>
##  <Returns>A string.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##   this function returns the name of the underlying graph of <A>gamma</A>
##  (see  <Ref BookName="Digraphs" Attr="DigraphSymmetricClosure"/>).  
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  The string returned will start with 3 or 4 letter, and then contain 2 
##  numbers enclosed in the "[" and "]" characters, separated from eachother by
##  the character ";". In the following we give the 3 possible strings of 
##  letters found in these names, and their meaning:
##  <List>
##  <Mark><C>"GHAT"</C></Mark>
##  <Item>This means the underlying graph is <M>G</M>-half-arc-transitive for
##  some subgroup of its automorphism group.</Item>
##  <Mark><C>"HAT"</C></Mark>
##  <Item>This means the underlying graph is half-arc-transitive (i.e. it is
##        <M>G</M>-half-arc-transitive where <M>G</M> is its automorphism group.
##  </Item>
##  <Mark><C>"GWD"</C></Mark>
##  <Item>This means the underlying graph is a generalized wreath graph.
##  </Item>
##  </List>
##  The underlying graph corresponding to this string is then the graph in the
##  list found in <Cite Key="PSV_2015"/> with the same name as the string, and 
##  indexed by the remaining two integers in the string.
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(700,40,true);;
##gap> NameOfUnderlyingGraph(gamma);
##"GHAT[700;12]"
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("NameOfUnderlyingGraph", IsDigraph);

################################################################################
##
#A  MaximumArcTransitiveness( <digraph> )
##  
##  <#GAPDoc Label="MaximumArcTransitiveness">
##  <ManSection>
##  <Attr Name="MaximumArcTransitiveness"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the maximum integer <M>s</M> such that <A>gamma</A> 
##  is <M>s</M>-arc-transitive.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  An <M>s</M><E>-arc</E> of a digraph <M>\Gamma</M> is an <M>(s+1)</M>-tuple 
##  <M>(v_0, v_1,\dots, v_s)</M> of vertices of <M>\Gamma</M>, such that 
##  <M>(v_{{i−1}}, v_i)</M> is an arc of <M>\Gamma</M> for every 
##  <M>i\in \{{1,\dots, s}\}</M> and <M>v_{{i−1}} &neq; v_{{i+1}}</M> for every
##  <M>i\in \{{1,\dots,s-1}\}</M>. A digraph <M>\Gamma</M> is 
##  <M>s</M><E>-arc-transitive</E> if the automorphism group of <M>\Gamma</M>
##  acts transitively on the set of <M>s</M>-arcs of <M>\Gamma</M>. 
##  <P/>
##  For more information on <M>s</M>-arc-transitive graphs, see
## TODO REF 
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(748,18,true);;
##gap> MaximumArcTransitiveness(gamma);
##373
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("MaximumArcTransitiveness", IsDigraph);

################################################################################
##
#A  StabIndexMinATUnd( <digraph> )
##  
##  <#GAPDoc Label="StabIndexMinATUnd">
##  <ManSection>
##  <Attr Name="StabIndexMinATUnd"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the index of a vertex stabilizer in the smallest
##  arc-transitive group of automorphisms of the underlying graph of 
##  <A>gamma</A>, if defined (see <Ref Attr="NameOfUnderlyingGraph"/>). 
##  Otherwise, this function returns <C>0</C>
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  Let <M>\Gamma</M> be an arc-transitive 2-valent digraph stored in this 
##  package, with automorphism group <M>G</M>. Further, let <M>T</M> be the 
##  smallest subgroup of the automorphism group of the underlying graph of 
##  <M>\Gamma</M> such that the group is arc-transitive. If <M>G&lt;T</M>,
##  then this function returns the index <M>|T_v:G_v|</M> for a vertex <M>v</M>
##  in <M>\Gamma</M>. Otherwise, it returns <M>0</M>. 
##  <P/>
##  For more information on this attribute, see <Cite Key="PSV_2015"/>.
##  TODO add ref?
##    <Example>
##      <![CDATA[
##gap> gammas:=AllAT2ValentDigraphs(420,true);;
##gap> StabIndexMinATUnd(gammas[20]);
##0
##gap> StabIndexMinATUnd(gammas[40]);
##2
##gap> StabIndexMinATUnd(gammas[76]);
##8
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("StabIndexMinATUnd", IsDigraph);

################################################################################
##
#A  StabIndexUnd( <digraph> )
##  
##  <#GAPDoc Label="StabIndexUnd">
##  <ManSection>
##  <Attr Name="StabIndexUnd"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the index of a vertex stabilizer in the automorphism
##  group of the underlying graph of <A>gamma</A>. 
##  (see <Ref Attr="NameOfUnderlyingGraph"/>). 
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  Let <M>\Gamma</M> be an arc-transitive 2-valent digraph stored in this 
##  package, with automorphism group <M>G</M>. Further, let <M>A</M> be the 
##  automorphism group of the underlying graph of <M>\Gamma</M>. Then this 
##  function returns the index <M>|A_v:G_v|</M> for a vertex <M>v</M>
##  in <M>\Gamma</M>. 
##  TODO add ref?
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(102,16,true);;
##gap> StabIndexUnd(gamma);
##3
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("StabIndexUnd", IsDigraph);

################################################################################
##
#A  ATD2ValentRadius( <digraph> )
##  
##  <#GAPDoc Label="ATD2ValentRadius">
##  <ManSection>
##  <Attr Name="ATD2ValentRadius"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the radius of <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of radius and more information about this parameter, see
##  <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(48,4,true);;
##gap> ATD2ValentRadius(gamma);
##3
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("ATD2ValentRadius", IsDigraph);

################################################################################
##
#A  ATD2ValentAttachmentNo( <digraph> )
##  
##  <#GAPDoc Label="ATD2ValentAttachmentNo">
##  <ManSection>
##  <Attr Name="ATD2ValentAttachmentNo"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the attachment number of <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of attachment number and more information about this 
##  parameter, see <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(48,4,true);;
##gap> ATD2ValentAttachmentNo(gamma);
##3
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("ATD2ValentAttachmentNo", IsDigraph);

################################################################################
##
#A  ATD2ValentAttachmentType( <digraph> )
##  
##  <#GAPDoc Label="ATD2ValentAttachmentType">
##  <ManSection>
##  <Attr Name="ATD2ValentAttachmentType"
##   Arg='gamma'/>
##  <Returns>An string.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the attachment number of <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of attachment type and more information about this 
##  parameter, see <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(102,16,true);;
##gap> ATD2ValentAttachmentType(gamma);
##3
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("ATD2ValentAttachmentType", IsDigraph);

################################################################################
##
#A  DigraphNrAlterCycles( <digraph> )
##  
##  <#GAPDoc Label="DigraphNrAlterCycles">
##  <ManSection>
##  <Attr Name="DigraphNrAlterCycles"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the number of alternating cycles in <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of alternating cycles and more information about this 
##  parameter, see <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(100,4,true);;
##gap> DigraphNrAlterCycles(gamma);
##10
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("DigraphNrAlterCycles", IsDigraph);

################################################################################
##
#A  DigraphAlterExponent( <digraph> )
##  
##  <#GAPDoc Label="DigraphAlterExponent">
##  <ManSection>
##  <Attr Name="DigraphAlterExponent"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the alter-exponent of <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of alter-exponent and more information about this 
##  parameter, see <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(100,4,true);;
##gap> DigraphAlterExponent(gamma);
##1
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("DigraphAlterExponent", IsDigraph);

################################################################################
##
#A  DigraphAlterPerimeter( <digraph> )
##  
##  <#GAPDoc Label="DigraphAlterPerimeter">
##  <ManSection>
##  <Attr Name="DigraphAlterPerimeter"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the alter-perimeter of <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of alter-perimeter and more information about this 
##  parameter, see <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(100,4,true);;
##gap> DigraphAlterPerimeter(gamma);
##10
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("DigraphAlterPerimeter", IsDigraph);

################################################################################
##
#A  DigraphAlterSequence( <digraph> )
##  
##  <#GAPDoc Label="DigraphAlterSequence">
##  <ManSection>
##  <Attr Name="DigraphAlterSequence"
##   Arg='gamma'/>
##  <Returns>A list.</Returns>
##	
##  <Description>
##  Given an arc-transitive 2-valent digraph <A>gamma</A> from in the 
##  &GRSYLI; package such that its properties and attributes have been assigned,
##  this function returns the alter-sequence of <A>gamma</A>.
##  <P/>
##  The properties and attributes of an arc-transitive 2-valent digraph that can
##  be found in the &GRSYLI; package can be assigned using the function 
##  <Ref Func="SetAT2ValentDigraphProps"/>, or loaded automatically by the functions
##  <Ref Func="AT2ValentDigraph"/>, <Ref Func="AllAT2ValentDigraphs"/> or 
##  <Ref Func="IteratorOfAT2ValentDigraphs"/>.
##  <P/>
##  For the definition of alter-sequence and more information about this 
##  parameter, see <Cite Key="PSV_2015"/>.
##  TODO add definitions?
##    <Example>
##      <![CDATA[
##gap> gamma:=AT2ValentDigraph(100,4,true);;
##gap> DigraphAlterSequence(gamma);
##[ 10 ]
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("DigraphAlterSequence", IsDigraph);

#############################################################################
##
#E

