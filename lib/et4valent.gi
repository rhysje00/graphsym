#############################################################################
##
#W    utils.gi    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for functions that access the edge-transitive 4-valent
##  graphs. 
##

################################################################################
##
#F  NrET4ValentGraphs( <integer> )
#F  NumberET4ValentGraphs( <integer> )
##  
InstallGlobalFunction(NrET4ValentGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrET4ValentGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>ET_4VALENT_ORDER_MAX then
    return 0;
  fi;
  return ET_4VALENT_NUMBERS[n];
end );

################################################################################
##
#F  IdOfET4ValentGraph( <digraph> )
##  
InstallMethod(IdOfET4ValentGraph, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta, edges;
  if not IsDigraph(gamma) then
    Error("usage: IdOfET4ValentGraph( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>ET_4VALENT_ORDER_MAX or ET_4VALENT_NUMBERS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[4] or DigraphHasLoops(gamma) or (not IsSymmetricDigraph(gamma)) then
    return fail;
  fi;

  edges:=Set(List(DigraphEdges(gamma),Set));
  if not IsTransitive(AutomorphismGroup(gamma),edges,OnSets) then
    return fail;
  fi;

  iter:=IteratorOfET4ValentGraphs(n);
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
#F  SetET4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetET4ValentGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetCubicVTGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrET4ValentGraphs(n);
  if i>nr then
    return;
  fi;
  
  # Set all Props and attributes for this record (Id is already set)  
  SetIdOfCubicVTGraph(gamma,i);

  return; 
end );

################################################################################
##
#F  SetET4ValentGraphProps( <digraph> )
##  
InstallGlobalFunction(SetET4ValentGraphProps, 
function(gamma)
  local idx;

  idx:=IdOfET4ValentGraph(gamma);

  if idx<>fail then
    SetET4ValentGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

################################################################################
##
#F  ET_4VALENT_Filename( <integer> )
##  
InstallGlobalFunction(ET_4VALENT_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: ET_4VALENT_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>ET_4VALENT_ORDER_MAX or NrET4ValentGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("ET_4valent_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("grsyli","graphs/et4valent"),fn);  
end );

#############################################################################
##
#F  ET4ValentGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(ET4ValentGraph,
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
    Error("usage: ET4ValentGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=ET_4VALENT_Filename(n);
  if fn=fail or i>NrET4ValentGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetET4ValentGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllET4ValentGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllET4ValentGraphs,
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
    Error("usage: AllET4ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=ET_4VALENT_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrET4ValentGraphs(n)] do
      SetET4ValentGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  IteratorOfET4ValentGraphs( <integer> )
##  
InstallGlobalFunction(IteratorOfET4ValentGraphs,
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
    Error("usage: IteratorOfET4ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=ET_4VALENT_Filename(n);
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
      SetET4ValentGraphPropsNC(next,n,iter!.count);
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
