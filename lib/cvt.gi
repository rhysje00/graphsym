#############################################################################
##
#W    utils.gi    GRaphs with SYmmetries LIbrary       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for functions that access the cubic v-t graphs. 
##

################################################################################
##
#F  NrCubicVTGraphs( <integer> )
#F  NumberCubicVTGraphs( <integer> )
##  
InstallGlobalFunction(NrCubicVTGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrCubicVTGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>CVT_ORDER_MAX then
    return 0;
  fi;
  return CVT_NUMBER_GRAPHS[n];
end );

################################################################################
##
#F  CubicVTGraphId( <digraph> )
##  
InstallMethod(CubicVTGraphId, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: CubicVTGraphId( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>CVT_ORDER_MAX or CVT_NUMBER_GRAPHS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[3] or DigraphHasLoops(gamma) or (not IsSymmetricDigraph(gamma)) then
    return fail;
  fi;
  if not IsVertexTransitive(gamma) then
    return fail;
  fi;

  iter:=CubicVTGraphIterator(n);
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
#F  SetCubicVTGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetCubicVTGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetCubicVTGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrCubicVTGraphs(n);
  if i>nr then
    return;
  fi;
  
  rc:=CVT_GRAPH_INFO[n,i];

  # Set all Props and attributes for this record (Id is already set)  
  SetCubicVTGraphId(gamma,i);
  SetIsCubicGraph(gamma,true);
  SetIsVertexTransitive(gamma,true);
  SetIsCayleyGraph(gamma,rc[4]); #  SetFilterObj(gamma, IsCayleyDigraph);
  SetIsBipartiteDigraph(gamma,rc[3]);
  SetIsArcTransitiveDigraph(gamma,rc[5]);
  SetIsSplitPraegerXuGraph(gamma,rc[6]);
  SetHasSolvableAutGroup(gamma,rc[7]);

  SetDigraphDiameter(gamma,rc[1]);
  SetDigraphUndirectedGirth(gamma,rc[2]);
  SetSizeStabAut2CVT(gamma,rc[8]);

  return; 
end );

################################################################################
##
#F  SetCubicVTGraphProps( <digraph> )
##  
InstallGlobalFunction(SetCubicVTGraphProps, 
function(gamma)
  local idx;

  idx:=CubicVTGraphId(gamma);

  if idx<>fail then
    SetCubicVTGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

#############################################################################
##
#F  SmallCubicVTGraphsInfo  
##
InstallGlobalFunction(SmallCubicVTGraphsInfo,
function(n)
  local nr, info, nrbp, nrcay, nrat, nrspx, nrsv, diams, girths, auts, pair, s;

  if not IsPosInt(n) then
    Error("usage: SmallCubicVTGraphsInfo( <n> ), where <n> is a positive integer.");
  fi;
  if IsOddInt(n) then
    Print("  CVT: There are no cubic graphs on ",n,", vertices, as it is odd.");
    return;
  fi;
  if n>1280 then
    Print("  CVT: Currently there is no information available on cubic vertex-transitive \n");
    Print("       graphs on ",n,", vertices, as this is larger than \n");
    Print("       CVT_ORDER_MAX = ",CVT_ORDER_MAX,".");
    return;
  fi;

  nr:=NrCubicVTGraphs(n);

  Print("  CVT: There are ",nr," cubic vertex-transitive graphs on ",n," vertices.\n\n");
  if nr=0 then
    return;
  fi;    

  info:=CVT_GRAPH_INFO[n];
  nrbp:=Number(CVT_GRAPH_INFO[n]{[1..nr]}[3],x->x);
  nrcay:=Number(CVT_GRAPH_INFO[n]{[1..nr]}[4],x->x);
  nrat:=Number(CVT_GRAPH_INFO[n]{[1..nr]}[5],x->x);
  nrspx:=Number(CVT_GRAPH_INFO[n]{[1..nr]}[6],x->x);
  nrsv:=Number(CVT_GRAPH_INFO[n]{[1..nr]}[7],x->x);

  Print("  Of these ",nr," graphs, there are;\n");
  Print("     - ",nrbp," bipartite graphs, \n");
  Print("     - ",nrcay," Cayley graphs, \n");
  Print("     - ",nrat," arc-transitive graphs, \n");
  Print("     - ",nrspx," split Praeger-Xu graphs, \n");
  Print("     - ",nrsv," graphs with solvable automorphism group. \n\n");

  # diams:=Collected(CVT_GRAPH_INFO[n]{[1..nr]}[1]);
  # girths:=Collected(CVT_GRAPH_INFO[n]{[1..nr]}[2]);
  # auts:=Collected(CVT_GRAPH_INFO[n]{[1..nr]}[8]);

  # Print("  Other known properties of these graphs are;\n");
  # Print("     - Diameters: there are \n");
  # for pair in diams do
  #   s:="";
  #   if pair[2]>1 then
  #     s:="s";
  #   fi;
  #   Print("                            ",pair[2], " graph",s," of diameter ",pair[1],"\n");
  # od;
  # Print("     - Girths: there are \n");
  # for pair in girths do
  #   s:="";
  #   if pair[2]>1 then
  #     s:="s";
  #   fi;
  #   Print("                            ",pair[2], " graph",s," of girth ",pair[1],"\n");
  # od;
  # Print("     - Stabilizer size????: there are \n");
  # for pair in auts do
  #   s:="";
  #   if pair[2]>1 then
  #     s:="s";
  #   fi;
  #   Print("                            ",pair[2], " graph",s," of ???? ",pair[1],"\n");
  # od;
  return;
end );

################################################################################
##
#F  CVT_Filename( <integer> )
##  
InstallGlobalFunction(CVT_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: CVT_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>CVT_ORDER_MAX or NrCubicVTGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("CubicVTgraphs_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("grsyli","graphs/cvt"),fn);  
end );

#############################################################################
##
#F  CubicVTGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(CubicVTGraph,
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
    Error("usage: CubicVTGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=CVT_Filename(n);
  if fn=fail or i>NrCubicVTGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetCubicVTGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllCubicVTGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllCubicVTGraphs,
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
    Error("usage: AllCubicVTGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=CVT_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrCubicVTGraphs(n)] do
      SetCubicVTGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  CubicVTGraphIterator( <integer> )
##  
InstallGlobalFunction(CubicVTGraphIterator,
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
    Error("usage: CubicVTGraphIterator( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=CVT_Filename(n);
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
      SetCubicVTGraphPropsNC(next,n,iter!.count);
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

################################################################################
##
#O  IsCubicGraph( <digraph> )
##  
InstallMethod(IsCubicGraph, "for digraphs", [IsDigraph],
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

#############################################################################
##
#E
