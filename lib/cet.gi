#############################################################################
##
#W    utils.gi    GRaphs with SYmmetries LIbrary       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for functions that access the cubic e-t graphs. 
##

################################################################################
##
#F  NrCubicATGraphs( <integer> )
#F  NumberCubicATGraphs( <integer> )
##  
InstallGlobalFunction(NrCubicATGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrCubicATGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>CAT_ORDER_MAX then
    return 0;
  fi;
  return CAT_NUMBER_GRAPHS[n];
end );

################################################################################
##
#F  NrCubicSSGraphs( <integer> )
#F  NumberCubicSSGraphs( <integer> )
##  
InstallGlobalFunction(NrCubicSSGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrCubicSSGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>CSS_ORDER_MAX then
    return 0;
  fi;
  return CSS_NUMBER_GRAPHS[n];
end );


################################################################################
##
#F  NrCubicETGraphs( <integer> )
#F  NumberCubicETGraphs( <integer> )
##  
# InstallGlobalFunction(NrCubicETGraphs, 
# function(n)
#   if not IsPosInt(n) then
#     Error("usage: NrCubicETGraphs( <n> ), where <n> is a positive integer");
#   fi;
#   if n>CET_ORDER_MAX then
#     return 0;
#   fi;
#   return CET_NUMBER_GRAPHS[n];
# end );

################################################################################
##
#F  CubicATGraphId( <digraph> )
##  
InstallMethod(CubicATGraphId, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: CubicATGraphId( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>CAT_ORDER_MAX or CAT_NUMBER_GRAPHS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[3] or DigraphHasLoops(gamma) or (not IsSymmetricDigraph(gamma)) then
    return fail;
  fi;
  if not IsVertexTransitive(gamma) then
    return fail;
  fi;
  if not IsArcTransitiveDigraph(gamma) then
    return fail;
  fi;

  iter:=CubicATGraphIterator(n);
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
#F  CubicSSGraphId( <digraph> )
##  
InstallMethod(CubicSSGraphId, "for a digraph", [IsDigraph],
function(gamma)
  local n, edges, aut, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: CubicSSGraphId( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>CSS_ORDER_MAX or CSS_NUMBER_GRAPHS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[3] or DigraphHasLoops(gamma) or (not IsSymmetricDigraph(gamma)) then
    return fail;
  fi;
  if IsArcTransitiveDigraph(gamma) then
    return fail;
  fi;
  edges:=Unique(List(DigraphEdges(gamma),SSortedList));
  aut:=AutomorphismGroup(gamma);
  if not IsTransitive(aut,edges,OnSets) then
    return fail;
  fi;

  iter:=CubicSSGraphIterator(n);
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
#F  SetCubicATGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetCubicATGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetCubicATGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrCubicATGraphs(n);
  if i>nr then
    return;
  fi;
  
  # rc:=CAT_GRAPH_INFO[n,i];

  # Set all Props and attributes for this record (Id is already set)  
  SetCubicATGraphId(gamma,i);
  SetIsCubicGraph(gamma,true);
  SetIsVertexTransitive(gamma,true);
  SetIsArcTransitiveDigraph(gamma,true);
  # SetIsBipartiteDigraph(gamma,rc[3]);

  # SetDigraphDiameter(gamma,rc[1]);
  # SetDigraphUndirectedGirth(gamma,rc[2]);

  return; 
end );

################################################################################
##
#F  SetCubicSSGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetCubicSSGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetCubicSSGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrCubicSSGraphs(n);
  if i>nr then
    return;
  fi;
  
  # rc:=CSS_GRAPH_INFO[n,i];

  # Set all Props and attributes for this record (Id is already set)  
  SetCubicSSGraphId(gamma,i);
  SetIsCubicGraph(gamma,true);
  SetIsVertexTransitive(gamma,false);
  SetIsBipartiteDigraph(gamma,true);
  SetIsArcTransitiveDigraph(gamma,false);

  # SetDigraphDiameter(gamma,rc[1]);
  # SetDigraphUndirectedGirth(gamma,rc[2]);

  return; 
end );


################################################################################
##
#F  SetCubicATGraphProps( <digraph> )
##  
InstallGlobalFunction(SetCubicATGraphProps, 
function(gamma)
  local idx;

  idx:=CubicATGraphId(gamma);

  if idx<>fail then
    SetCubicATGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

################################################################################
##
#F  SetCubicSSGraphProps( <digraph> )
##  
InstallGlobalFunction(SetCubicSSGraphProps, 
function(gamma)
  local idx;

  idx:=CubicSSGraphId(gamma);

  if idx<>fail then
    SetCubicSSGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

################################################################################
##
#F  CAT_Filename( <integer> )
##  
InstallGlobalFunction(CAT_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: CAT_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>CAT_ORDER_MAX or NrCubicATGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("CubicATgraphs_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("graphsym","graphs/cet/cat"),fn);  
end );

################################################################################
##
#F  CSS_Filename( <integer> )
##  
InstallGlobalFunction(CSS_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: CSS_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>CSS_ORDER_MAX or NrCubicSSGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("CubicSSgraphs_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("graphsym","graphs/cet/css"),fn);  
end );

#############################################################################
##
#F  CubicATGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(CubicATGraph,
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
    Error("usage: CubicATGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=CAT_Filename(n);
  if fn=fail or i>NrCubicATGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetCubicATGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  CubicSSGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(CubicSSGraph,
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
    Error("usage: CubicSSGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=CSS_Filename(n);
  if fn=fail or i>NrCubicSSGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetCubicSSGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllCubicATGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllCubicATGraphs,
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
    Error("usage: AllCubicATGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=CAT_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrCubicATGraphs(n)] do
      SetCubicATGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  AllCubicSSGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllCubicSSGraphs,
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
    Error("usage: AllCubicSSGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=CSS_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrCubicSSGraphs(n)] do
      SetCubicSSGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  CubicATGraphIterator( <integer> )
##  
InstallGlobalFunction(CubicATGraphIterator,
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
    Error("usage: CubicATGraphIterator( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=CAT_Filename(n);
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
      SetCubicATGraphPropsNC(next,n,iter!.count);
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
#F  CubicSSGraphIterator( <integer> )
##  
InstallGlobalFunction(CubicSSGraphIterator,
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
    Error("usage: CubicSSGraphIterator( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=CSS_Filename(n);
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
      SetCubicSSGraphPropsNC(next,n,iter!.count);
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
