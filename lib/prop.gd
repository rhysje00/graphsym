#############################################################################
##
#W    prop.gd    Cubic vertex-transitive graphs library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for properties and attributes file for cubic v-t graphs. 
##

######################
##    PROPERTIES    ##
######################

################################################################################
##
#P  IsCubicDigraph( <digraph> )
##  
##  <#GAPDoc Label="IsCubicDigraph">
##  <ManSection>
##  <Prop Name="IsCubicDigraph"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function returns <K>true</K> if
##  <A>gamma</A> is a cubic digraph, and otherwise it returns <K>false</K>.
##    <Example>
##      <![CDATA[
##gap> IsCubicDigraph(CycleDigraph(5));
##false
##gap> IsCubicDigraph(CompleteDigraph(4));
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsCubicDigraph", IsDigraph);

################################################################################
##
#P  IsCayleyDigraphCVT( <digraph> )
##  
##  <#GAPDoc Label="IsCayleyDigraphCVT">
##  <ManSection>
##  <Prop Name="IsCayleyDigraphCVT"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A> from in the &CVT; package such that its 
##  properties and attributes have been assigned, this function returns
##  <K>true</K> if <A>gamma</A> is a Cayley (di)graph and <K>false</K> 
##  otherwise.
##  <P/>
##  The properties and attributes of a cubic vertex-transitive graph that can
##  be found in the &CVT; package can be assigned using the function 
##  <Ref Func="SetCubicVTGraphProps"/>, or loaded automatically by the functions
##  <Ref Func="CubicVTGraph"/>, <Ref Func="AllCubicVTGraphs"/> or 
##  <Ref Func="IteratorOfCubicVTGraphs"/>. This property is not equivalent to
##  <Ref BookName="Digraphs" Prop="IsCayleyDigraph"/>, as a digraph with this 
##  property has associated group and generators.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(50,2,true);;
##gap> IsCayleyDigraphCVT(gamma);
##true
##gap> gamma:=CubicVTGraph(50,9,true);;
##gap> IsCayleyDigraphCVT(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsCayleyDigraphCVT", IsDigraph);

################################################################################
##
#P  IsArcTransitiveDigraph( <digraph> )
##  
##  <#GAPDoc Label="IsArcTransitiveDigraph">
##  <ManSection>
##  <Prop Name="IsArcTransitiveDigraph"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function returns <K>true</K> if 
##  <A>gamma</A> is arc-transitive and <K>false</K> otherwise. This is a 
##  synonym for the function <Ref BookName="Digraphs" Prop="IsEdgeTransitive"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(50,4,true);;
##gap> IsArcTransitiveDigraph(gamma);
##false
##gap> gamma:=CubicVTGraph(50,8,true);;
##gap> IsArcTransitiveDigraph(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonymAttr("IsArcTransitiveDigraph", IsEdgeTransitive);

################################################################################
##
#P  IsSPXDigraphCVT( <digraph> )
##  
##  <#GAPDoc Label="IsSPXDigraphCVT">
##  <ManSection>
##  <Prop Name="IsSPXDigraphCVT"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A> from in the &CVT; package such that its 
##  properties and attributes have been assigned, this function returns
##  <K>true</K> if <A>gamma</A> is a split Praeger-Xu graph and <K>false</K> 
##  otherwise.
##  <P/>
##  The properties and attributes of a cubic vertex-transitive graph that can
##  be found in the &CVT; package can be assigned using the function 
##  <Ref Func="SetCubicVTGraphProps"/>, or loaded automatically by the functions
##  <Ref Func="CubicVTGraph"/>, <Ref Func="AllCubicVTGraphs"/> or 
##  <Ref Func="IteratorOfCubicVTGraphs"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(48,6,true);;
##gap> IsSPXDigraphCVT(gamma);
##false
##gap> gamma:=CubicVTGraph(48,7,true);;
##gap> IsSPXDigraphCVT(gamma);
##true
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsSPXDigraphCVT", IsDigraph);

################################################################################
##
#P  HasSolvableAutGroup( <digraph> )
##  
##  <#GAPDoc Label="HasSolvableAutGroup">
##  <ManSection>
##  <Prop Name="HasSolvableAutGroup"
##   Arg='gamma'/>
##  <Returns><K>true</K> or <K>false</K>.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function returns <K>true</K> if 
##  <A>gamma</A> has a solvable automorphism group,  and <K>false</K> otherwise.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(102,15,true);;
##gap> HasSolvableAutGroup(gamma);
##true
##gap> gamma:=CubicVTGraph(102,16,true);;
##gap> HasSolvableAutGroup(gamma);
##false
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("HasSolvableAutGroup", IsDigraph);

######################
##    ATTRIBUTES    ##
######################

################################################################################
##
#A  SizeStabAut2CVT( <digraph> )
##  
##  <#GAPDoc Label="SizeStabAut2CVT">
##  <ManSection>
##  <Prop Name="SizeStabAut2CVT"
##   Arg='gamma'/>
##  <Returns>An integer.</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A> from in the &CVT; package such that its 
##  properties and attributes have been assigned, this function returns the
##  TODO ?????
##  <P/>
##  The properties and attributes of a cubic vertex-transitive graph that can
##  be found in the &CVT; package can be assigned using the function 
##  <Ref Func="SetCubicVTGraphProps"/>, or loaded automatically by the functions
##  <Ref Func="CubicVTGraph"/>, <Ref Func="AllCubicVTGraphs"/> or 
##  <Ref Func="IteratorOfCubicVTGraphs"/>.
##    <Example>
##      <![CDATA[
##gap> gamma:=CubicVTGraph(102,16,true);;
##gap> SizeStabAut2CVT(gamma);
##3
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute("SizeStabAut2CVT", IsDigraph);
