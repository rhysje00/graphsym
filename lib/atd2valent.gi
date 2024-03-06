#############################################################################
##
#W    utils.gi    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Implementation file for functions that access the arc-transitive 2-valent
##  digraphs. 
##

################################################################################
##
#F  NrATD2ValentDigraphs( <integer> )
#F  NumberATD2ValentDigraphs( <integer> )
##  
InstallGlobalFunction(NrATD2ValentDigraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrATD2ValentDigraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>ATD_2VALENT_ORDER_MAX then
    return 0;
  fi;
  return ATD_2VALENT_NUMBERS[n];
end );

################################################################################
##
#F  IdOfATD2ValentDigraph( <digraph> )
##  
InstallMethod(IdOfATD2ValentDigraph, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: IdOfATD2ValentDigraph( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>ATD_2VALENT_ORDER_MAX or ATD_2VALENT_NUMBERS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[2] or InDegreeSet<>[2] then
    return fail;
  fi;
  if not IsTransitive(AutomorphismGroup(gamma)) then
    return fail;
  fi;

  iter:=IteratorOfATD2ValentDigraphs(n);
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
#F  SetATD2ValentDigraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetATD2ValentDigraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetCubicVTGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrATD2ValentDigraphs(n);
  if i>nr then
    return;
  fi;
  
  rc:=ATD_2VALENT_INFO[n,i];
  # Set all Props and attributes for this record (Id is already set)  
  SetIdOfATD2ValentDigraph(gamma,i);
  SetIsSelfOppositeDigraph(gamma,rc[1]);
  SetHasATUnderlyingGraph(gamma,rc[3]);
  SetHasAbelianVertexStabilizer(gamma,rc[6]);
  SetHasAbelianVertexStabilizer(gamma,rc[9]);
  SetIsGeneralizedWreathDigraph(gamma,rc[17]);

  SetIdOfOppositeDigraph(gamma,rc[2]);
  SetNameOfUnderlyingGraph(gamma,rc[4]);
  SetMaximumArcTransitiveness(gamma,rc[5]);
  SetStabIndexMinATUnd(gamma,rc[7]);
  if IsInt(rc[8]) then 
    SetStabIndexUnd(gamma,rc[8]);
  else 
    SetStabIndexUnd(gamma,EvalString(rc[8])); 
  fi;
  SetATD2ValentRadius(gamma,rc[10]);
  SetATD2ValentAttachmentNo(gamma,rc[11]);
  SetATD2ValentAttachmentType(gamma,rc[12]);
  SetDigraphNrAlterCycles(gamma,rc[13]);
  SetDigraphAlterExponent(gamma,rc[14]);
  SetDigraphAlterPerimeter(gamma,rc[15]);
  SetDigraphAlterSequence(gamma,rc[16]);

  return; 
end );

################################################################################
##
#F  SetATD2ValentDigraphProps( <digraph> )
##  
InstallGlobalFunction(SetATD2ValentDigraphProps, 
function(gamma)
  local idx;

  idx:=IdOfATD2ValentDigraph(gamma);

  if idx<>fail then
    SetATD2ValentDigraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

################################################################################
##
#F  ATD_2valent_Filename( <integer> )
##  
InstallGlobalFunction(ATD_2valent_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: ATD_2valent_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>ATD_2VALENT_ORDER_MAX or NrATD2ValentDigraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("ATD_2valent_",String(n),".ds6");
  
  return Filename(DirectoriesPackageLibrary("grsyli","graphs/atd2valent"),fn);  
end );

#############################################################################
##
#F  ATD2ValentDigraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(ATD2ValentDigraph,
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
    Error("usage: ATD2ValentDigraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=ATD_2valent_Filename(n);
  if fn=fail or i>NrATD2ValentDigraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetATD2ValentDigraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllATD2ValentDigraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllATD2ValentDigraphs,
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
    Error("usage: AllATD2ValentDigraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=ATD_2valent_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrATD2ValentDigraphs(n)] do
      SetATD2ValentDigraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  IteratorOfATD2ValentDigraphs( <integer> )
##  
InstallGlobalFunction(IteratorOfATD2ValentDigraphs,
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
    Error("usage: IteratorOfATD2ValentDigraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=ATD_2valent_Filename(n);
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
      SetATD2ValentDigraphPropsNC(next,n,iter!.count);
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

######################
##    PROPERTIES    ##
######################

#############################################################################
##
#P  IsSelfOppositeDigraph( <digraph> )
##  
InstallMethod(IsSelfOppositeDigraph, "for a digraph", [IsDigraph],
function(gamma)
  return IsIsomorphicDigraph(gamma,DigraphReverse(gamma));
end );


#############################################################################
##
#P  HasATUnderlyingGraph( <digraph> )
##  
InstallMethod(HasATUnderlyingGraph, "for a digraph", [IsDigraph],
function(gamma)
  return IsArcTransitiveDigraph(DigraphSymmetricClosure(gamma));
end );


#############################################################################
##
#P  HasAbelianVertexStabilizer( <digraph> )
# ##  
# InstallMethod(HasAbelianVertexStabilizer, "for a digraph", [IsDigraph],
# function(gamma)
#   return IsAbelian(Stabilizer(AutomorphismGroup(gamma),1));
# end );


#############################################################################
##
#E
