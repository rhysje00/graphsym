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
#F  NrGHAT4ValentGraphs( <integer> )
#F  NumberGHAT4ValentGraphs( <integer> )
##  
InstallGlobalFunction(NrGHAT4ValentGraphs, 
function(n)
  if not IsPosInt(n) then
    Error("usage: NrGHAT4ValentGraphs( <n> ), where <n> is a positive integer");
  fi;
  if n>GHAT_4VALENT_ORDER_MAX then
    return 0;
  fi;
  return GHAT_4VALENT_NUMBERS[n];
end );

################################################################################
##
#F  GHAT4ValentGraphId( <digraph> )
##  
InstallMethod(GHAT4ValentGraphId, "for a digraph", [IsDigraph],
function(gamma)
  local n, iter, cnt, delta;
  if not IsDigraph(gamma) then
    Error("usage: GHAT4ValentGraphId( <gamma> ), where <gamma> is a digraph");
  fi;

  n:=DigraphNrVertices(gamma);
  if n>GHAT_4VALENT_ORDER_MAX or GHAT_4VALENT_NUMBERS[n]=0 then
    return fail;
  fi;
  if OutDegreeSet(gamma)<>[4] or DigraphHasLoops(gamma) or (not IsSymmetricDigraph(gamma)) then
    return fail;
  fi;
  if not IsVertexTransitive(gamma) then
    return fail;
  fi;

  iter:=GHAT4ValentGraphIterator(n);
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
#F  SetGHAT4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
InstallGlobalFunction(SetGHAT4ValentGraphPropsNC, 
function(gamma,n,i)
  local nr,rc;

  if not (IsPosInt(n) and IsPosInt(i) and IsDigraph(gamma)) then
    Error("usage: SetGHAT4ValentGraphPropsNC( <gamma>, <n>, <i> ), where <gamma> is a digraph, \
                   and <n> and <i> are positive integers");
  fi;
  
  nr := NrGHAT4ValentGraphs(n);
  if i>nr then
    return;
  fi;
  
  rc:=GHAT_4VALENT_GRAPH_INFO[n,i];

  # Set all Props and attributes for this record (Id is already set)  
  SetGHAT4ValentGraphId(gamma,i);
  SetIsVertexTransitive(gamma,true);
  SetIsCayleyGraph(gamma,not rc[3]="n-Cay"); #  SetFilterObj(gamma, IsCayleyDigraph);
  SetIsBipartiteDigraph(gamma,rc[2]);
  SetIsArcTransitiveDigraph(gamma,false);
  SetHasSolvableAutGroup(gamma,rc[6]);

  SetDigraphUndirectedGirth(gamma,rc[1]);
  SetCayleyType(gamma,rc[3]);
  SetSizeStabAut(gamma,rc[4]);
  SetSizeStabGHATGroups(gamma,rc[5]);  
  SetConsistentCycleTypes(gamma,rc[7]);

  return; 
end );

################################################################################
##
#F  SetGHAT4ValentGraphProps( <digraph> )
##  
InstallGlobalFunction(SetGHAT4ValentGraphProps, 
function(gamma)
  local idx;

  idx:=GHAT4ValentGraphId(gamma);

  if idx<>fail then
    SetGHAT4ValentGraphPropsNC(gamma,DigraphNrVertices(gamma),idx);
  fi;
  return;
end );

#############################################################################
##
#F  SmallGHAT4ValentGraphsInfo  
##
# InstallGlobalFunction(SmallGHAT4ValentGraphsInfo,
# function(n)
#   local nr, info, nrbp, nrcay, nrat, nrspx, nrsv, diams, girths, auts, pair, s;

#   if not IsPosInt(n) then
#     Error("usage: SmallGHAT4ValentGraphsInfo( <n> ), where <n> is a positive integer.");
#   fi;
#   if IsOddInt(n) then
#     Print("  CVT: There are no cubic graphs on ",n,", vertices, as it is odd.");
#     return;
#   fi;
#   if n>1280 then
#     Print("  CVT: Currently there is no information available on cubic vertex-transitive \n");
#     Print("       graphs on ",n,", vertices, as this is larger than \n");
#     Print("       GHAT_4VALENT_ORDER_MAX = ",GHAT_4VALENT_ORDER_MAX,".");
#     return;
#   fi;

#   nr:=NrGHAT4ValentGraphs(n);

#   Print("  CVT: There are ",nr," cubic vertex-transitive graphs on ",n," vertices.\n\n");
#   if nr=0 then
#     return;
#   fi;    

#   info:=GHAT_4VALENT_GRAPH_INFO[n];
#   nrbp:=Number(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[3],x->x);
#   nrcay:=Number(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[4],x->x);
#   nrat:=Number(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[5],x->x);
#   nrspx:=Number(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[6],x->x);
#   nrsv:=Number(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[7],x->x);

#   Print("  Of these ",nr," graphs, there are;\n");
#   Print("     - ",nrbp," bipartite graphs, \n");
#   Print("     - ",nrcay," Cayley graphs, \n");
#   Print("     - ",nrat," arc-transitive graphs, \n");
#   Print("     - ",nrspx," split Praeger-Xu graphs, \n");
#   Print("     - ",nrsv," graphs with solvable automorphism group. \n\n");

#   # diams:=Collected(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[1]);
#   # girths:=Collected(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[2]);
#   # auts:=Collected(GHAT_4VALENT_GRAPH_INFO[n]{[1..nr]}[8]);

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
#F  GHAT_4VALENT_Filename( <integer> )
##  
InstallGlobalFunction(GHAT_4VALENT_Filename,
function(n)
  local fn;

  if not IsPosInt(n) then
    Error("usage: GHAT_4VALENT_Filename( <n> ), where <n> is a positive integer");
  fi;
  if n>GHAT_4VALENT_ORDER_MAX or NrGHAT4ValentGraphs(n)=0 then
    return fail;
  fi;
  
  fn := Concatenation("GHAT_4valent_",String(n),".s6");
  
  return Filename(DirectoriesPackageLibrary("grsyli","graphs/ghat4valent"),fn);  
end );

#############################################################################
##
#F  GHAT4ValentGraph( <integer> , <integer>[, <bool>] )
##  
InstallGlobalFunction(GHAT4ValentGraph,
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
    Error("usage: GHAT4ValentGraph( <n>, <i>[, <data>] ), where <n>, <i> are \
                  positive integers and <data> is a boolean");
  fi;

  fn:=GHAT_4VALENT_Filename(n);
  if fn=fail or i>NrGHAT4ValentGraphs(n) then
    return fail;
  fi;

  gamma:= ReadDigraphs(fn,i);
  if data then
    SetGHAT4ValentGraphPropsNC(gamma,n,i);
  fi;
  return gamma;
end );

#############################################################################
##
#F  AllGHAT4ValentGraphs( <integer> , <integer> )
##  
InstallGlobalFunction(AllGHAT4ValentGraphs,
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
    Error("usage: AllGHAT4ValentGraphs( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  fn:=GHAT_4VALENT_Filename(n);
  if fn=fail then
    return fail;
  fi;
  
  lgraphs:=ReadDigraphs(fn);
  if data then
    for i in [1..NrGHAT4ValentGraphs(n)] do
      SetGHAT4ValentGraphPropsNC(lgraphs[i],n,i);
    od;
  fi;

  return lgraphs; 
end );

#############################################################################
##
#F  GHAT4ValentGraphIterator( <integer> )
##  
InstallGlobalFunction(GHAT4ValentGraphIterator,
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
    Error("usage: GHAT4ValentGraphIterator( <n>[, <data>] ), where <n> is a \
                  positive integer and <data> is a boolean");
  fi;

  filename:=GHAT_4VALENT_Filename(n);
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
      SetGHAT4ValentGraphPropsNC(next,n,iter!.count);
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
