#############################################################################
##
#W    prop.gi    Cubic vertex-transitive graphs library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for properties and attributes of cubic v-t graphs. 
##

################################################################################
##
#O  IsCubicDigraph( <digraph> )
##  
InstallMethod(IsCubicDigraph, "for digraphs", [IsDigraph],
function(gamma)
  return OutDegreeSet(gamma)=[3] and InDegreeSet(gamma)=[3];
end );

################################################################################
##
#O  HasSolvableAutGroup( <digraph> )
##  
InstallMethod(HasSolvableAutGroup, "for digraphs", [IsDigraph],
function(gamma)
  return IsSolvableGroup(AutomorphismGroup(gamma));
end );
