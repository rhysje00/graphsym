#############################################################################
##
#W    utils.gi    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for functions that access the locally arc-transitive 
##  {3,4}-valent graphs. 
##

################################################################################
##
#F  NrLAT34ValentGraphs( <integer> )
#F  NumberLAT34ValentGraphs( <integer> )
##  
InstallGlobalFunction(NrLAT34ValentGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrLAT34ValentGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>LAT_34VALENT_ORDER_MAX then
    return 0;
  fi;
  return LAT_34VALENT_NUMBERS[n];
end );

################################################################################
##
#F  IdOfLAT34ValentGraph( <digraph> )
##  
InstallMethod(IdOfLAT34ValentGraph, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: IdOfLAT34ValentGraph( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>LAT_34VALENT_ORDER_MAX or LAT_34VALENT_NUMBERS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[2] or InDegreeSet<>[2] then
    return fail;
  fi;
  if not IsTransitive(AutomorphismGroup(gamma)) then
    return fail;
  fi;

  iter:=IteratorOfLAT34ValentGraphs(n);
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
#F  SetLAT34ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetLAT34ValentGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetCubicVTGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrLAT34ValentGraphs(n);
  if i>nr then
    return;
  fi;
  
  # Set all Props and attributes for this record (Id is already set)  
  SetIdOfCubicVTGraph(gamma,i);

  return; 
end );

################################################################################
##
#F  SetLAT34ValentGraphProps( <digraph> )
##  
InstallGlobalFunction(SetLAT34ValentGraphProps, 
function(gamma)
  local idx;

  idx:=IdOfLAT34ValentGraph(gamma);

  if idx<>fail then
    SetLAT34ValentGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

################################################################################
##
#F  LAT_34valent_Filename( <integer> )
##  
InstallGlobalFunction(LAT_34VALENT_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: LAT_34VALENT_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>LAT_34VALENT_ORDER_MAX or NrLAT34ValentGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("LAT34valent_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("grsyli","graphs/lat34valent"),fn);  
end );

#############################################################################
##
#F  LAT34ValentGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(LAT34ValentGraph,
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
    Error("usage: LAT34ValentGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=LAT_34VALENT_Filename(n);
  if fn=fail or i>NrLAT34ValentGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetLAT34ValentGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllLAT34ValentGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllLAT34ValentGraphs,
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
    Error("usage: AllLAT34ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=LAT_34VALENT_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrLAT34ValentGraphs(n)] do
      SetLAT34ValentGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  IteratorOfLAT34ValentGraphs( <integer> )
##  
InstallGlobalFunction(IteratorOfLAT34ValentGraphs,
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
    Error("usage: IteratorOfLAT34ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=LAT_34VALENT_Filename(n);
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
      SetLAT34ValentGraphPropsNC(next,n,iter!.count);
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
