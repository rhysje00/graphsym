#############################################################################
##
#W    utils.gi    GRaphs with SYmmetries LIbrary       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for functions that access the G-half-arc-transitive
##  graphs. 
##

################################################################################
##
#F  NrGW4ValentGraphs( <integer> )
#F  NumberGW4ValentGraphs( <integer> )
##  
InstallGlobalFunction(NrGW4ValentGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrGW4ValentGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>GWG_4VALENT_ORDER_MAX then
    return 0;
  fi;
  return GWG_4VALENT_NUMBERS[n];
end );

################################################################################
##
#F  IdOfGW4ValentGraph( <digraph> )
##  
InstallMethod(IdOfGW4ValentGraph, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: IdOfGW4ValentGraph( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>GWG_4VALENT_ORDER_MAX or GWG_4VALENT_NUMBERS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[4] or DigraphHasLoops(gamma) or (not IsSymmetricDigraph(gamma)) then
    return fail;
  fi;
  if not IsVertexTransitive(gamma) then
    return fail;
  fi;

  iter:=IteratorOfGW4ValentGraphs(n);
  cnt:=0;
  for delta in iter do
    cnt:=cnt+1;
    if IsIsomorphicDigraph(gamma,delta) then
      return cnt;
    fi;
  od;
  # Shouldn't get here if the package has a full enumeration on this number 
  # of vertices
  return fail;
end );

################################################################################
##
#F  SetGW4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetGW4ValentGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetGW4ValentGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrGW4ValentGraphs(n);
  if i>nr then
    return;
  fi;
  
  # Set all Props and attributes for this record (Id is already set)  
  SetIdOfGW4ValentGraph(gamma,i);
  SetIsVertexTransitive(gamma,true);
  SetIsArcTransitiveDigraph(gamma,false);
 #  SetHasSolvableAutGroup(gamma,rc[6]);

 # SetDigraphUndirectedGirth(gamma,rc[1]);
 # SetCayleyType(gamma,rc[3]);
 # SetSizeStabAut(gamma,rc[4]);
 # SetConsistentCycleTypes(gamma,rc[7]);
  SetIsGeneralisedWreathGraph(gamma,true);

  return; 
end );

################################################################################
##
#F  SetGW4ValentGraphProps( <digraph> )
##  
InstallGlobalFunction(SetGW4ValentGraphProps, 
function(gamma)
  local idx;

  idx:=IdOfGW4ValentGraph(gamma);

  if idx<>fail then
    SetGW4ValentGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

#############################################################################
##
#F  SmallGW4ValentGraphsInfo  
##
# InstallGlobalFunction(SmallGW4ValentGraphsInfo,
# function(n)
#   local nr, info, nrbp, nrcay, nrat, nrspx, nrsv, diams, girths, auts, pair, s;

#   if not IsPosInt(n) then
#     Error("usage: SmallGW4ValentGraphsInfo( <n> ), where <n> is a positive integer.");
#   fi;
#   if IsOddInt(n) then
#     Print("  CVT: There are no cubic graphs on ",n,", vertices, as it is odd.");
#     return;
#   fi;
#   if n>1280 then
#     Print("  CVT: Currently there is no information available on cubic vertex-transitive \n");
#     Print("       graphs on ",n,", vertices, as this is larger than \n");
#     Print("       GW_4VALENT_ORDER_MAX = ",GW_4VALENT_ORDER_MAX,".");
#     return;
#   fi;

#   nr:=NrGW4ValentGraphs(n);

#   Print("  CVT: There are ",nr," cubic vertex-transitive graphs on ",n," vertices.\n\n");
#   if nr=0 then
#     return;
#   fi;    

#   info:=GW_4VALENT_GRAPH_INFO[n];
#   nrbp:=Number(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[3],x->x);
#   nrcay:=Number(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[4],x->x);
#   nrat:=Number(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[5],x->x);
#   nrspx:=Number(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[6],x->x);
#   nrsv:=Number(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[7],x->x);

#   Print("  Of these ",nr," graphs, there are;\n");
#   Print("     - ",nrbp," bipartite graphs, \n");
#   Print("     - ",nrcay," Cayley graphs, \n");
#   Print("     - ",nrat," arc-transitive graphs, \n");
#   Print("     - ",nrspx," split Praeger-Xu graphs, \n");
#   Print("     - ",nrsv," graphs with solvable automorphism group. \n\n");

#   # diams:=Collected(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[1]);
#   # girths:=Collected(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[2]);
#   # auts:=Collected(GW_4VALENT_GRAPH_INFO[n]{[1..nr]}[8]);

#   # Print("  Other known properties of these graphs are;\n");
#   # Print("     - Diameters: there are \n");
#   # for pair in diams do
#   #   s:="";
#   #   if pair[2]>1 then
#   #     s:="s";
#   #   fi;
#   #   Print("                            ",pair[2], " graph",s," of diameter ",pair[1],"\n");
#   # od;
#   # Print("     - Girths: there are \n");
#   # for pair in girths do
#   #   s:="";
#   #   if pair[2]>1 then
#   #     s:="s";
#   #   fi;
#   #   Print("                            ",pair[2], " graph",s," of girth ",pair[1],"\n");
#   # od;
#   # Print("     - Stabilizer size????: there are \n");
#   # for pair in auts do
#   #   s:="";
#   #   if pair[2]>1 then
#   #     s:="s";
#   #   fi;
#   #   Print("                            ",pair[2], " graph",s," of ???? ",pair[1],"\n");
#   # od;
#   return;
# end );

################################################################################
##
#F  GWG_4VALENT_Filename( <integer> )
##  
InstallGlobalFunction(GWG_4VALENT_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: GWG_4VALENT_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>GWG_4VALENT_ORDER_MAX or NrGHAT4ValentGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("GWG_4valent_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("grsyli","graphs/gwg4valent"),fn);  
end );

#############################################################################
##
#F  GW4ValentGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(GW4ValentGraph,
function(args...)
  local n, i, data, fn, gamma;

  if Length(args)<2 or Length(args)>3 then
    Error("2 or 3 arguments are expected");
  fi;

  n:=args[1];
  i:=args[2];
  data:=false;
  if Length(args)=3 then  
    data:=args[3];
  fi;
  if not (IsPosInt(n) and IsPosInt(i) and IsBool(data)) then
    Error("usage: GW4ValentGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=GWG_4VALENT_Filename(n);
  if fn=fail or i>NrGW4ValentGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetGW4ValentGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllGW4ValentGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllGW4ValentGraphs,
function(args...)
  local n, data, fn, lgraphs, i;

  if Length(args)<1 or Length(args)>2 then
    Error("1 or 2 arguments are expected");
  fi;

  n:=args[1];
  data:=false;
  if Length(args)=2 then  
    data:=args[2];
  fi;
  if not (IsPosInt(n) and IsBool(data)) then
    Error("usage: AllGW4ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=GWG_4VALENT_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrGW4ValentGraphs(n)] do
      SetGW4ValentGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  IteratorOfGW4ValentGraphs( <integer> )
##  
InstallGlobalFunction(IteratorOfGW4ValentGraphs,
function(args...)
  local n, data, filename, decoder, file, record;

  if Length(args)<1 or Length(args)>2 then
    Error("1 or 2 arguments are expected");
  fi;

  n:=args[1];
  data:=false;
  if Length(args)=2 then  
    data:=args[2];
  fi;
  if not (IsPosInt(n) and IsBool(data)) then
    Error("usage: IteratorOfGW4ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=GWG_4VALENT_Filename(n);
  if filename=fail then
    return Iterator([]);
  fi;

  # fail is decoder, could use sparse6 function
  file := DigraphFile(UserHomeExpand(filename), fail, "r");
  
  record := rec(file := file, current := file!.coder(file));  

  if data then 
    record.count:=0;
  
    record.NextIterator := function(iter)                               
      local next, data;
      next := iter!.current;
      iter!.count:= iter!.count+1;
      iter!.current := iter!.file!.coder(iter!.file);
      SetGW4ValentGraphPropsNC(next,n,iter!.count);
      return next;
    end;

    record.ShallowCopy := function(iter)
      local file;
      file := DigraphFile(UserHomeExpand(filename), decoder, "r");
      return rec(file := file, current := file!.coder(file), count:= iter!.count);
    end;
 
  else
    record.NextIterator := function(iter)                               
      local next, data;
      next := iter!.current;
      iter!.current := iter!.file!.coder(iter!.file);
      return next;
    end;

    record.ShallowCopy := function(iter)
      local file;
      file := DigraphFile(UserHomeExpand(filename), decoder, "r");
      return rec(file := file, current := file!.coder(file));
    end;
  fi;

  record.IsDoneIterator := function(iter)
    if iter!.current = IO_Nothing then
      if not iter!.file!.closed then
        IO_Close(iter!.file);
      fi;
      return true;
    else
      return false;
    fi;
  end;

  return IteratorByFunctions(record);
end );

#############################################################################
##
#E
