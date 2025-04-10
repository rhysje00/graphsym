#############################################################################
##
#W  PackageInfo.g      GRaphs with SYmmetries LIbrary        Rhys J. Evans
##
##
##
SetPackageInfo( rec(

  PackageName := "GraphSym",
  Subtitle := "Graphs with symmetries library",
  Version := "0.1",
  Date := "10/04/2025",
  License := "GPL-2.0-or-later",

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.1">
##  <!ENTITY RELEASEDATE "10 April 2025">
##  <!ENTITY PKGWWWHOME "https://rhysje00.github.io/graphsym/">
##  <#/GAPDoc>

  PackageWWWHome :=
  Concatenation( "https://rhysje00.github.io/", LowercaseString( ~.PackageName ) ),

  SourceRepository := rec(
    Type := "git",
    URL := Concatenation("https://github.com/rhysje00/",
                         ~.PackageName),
  ),

  IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ), 

  SupportEmail := "rhysjevans00@gmail.com",

  ArchiveURL := Concatenation( ~.SourceRepository.URL,
                               "/releases/download/v", ~.Version,
                               "/", ~.PackageName, "-", ~.Version ),

  ArchiveFormats := ".tar.gz",

  Persons := [
    rec(
      IsAuthor := true,
      IsMaintainer := true,
      FirstNames := "Rhys J.",
      LastName := "Evans",
      WWWHome := "https://rhysje00.github.io/",
      Email := "rhysjevans00@gmail.com",
      Place := "Ljubljana, Slovenia",
      Institution := "Inštitut za matematiko, fiziko in mehaniko",
    ),

    rec(
      IsAuthor := true,
      IsMaintainer := false,
      FirstNames := "Antonio",
      LastName := "Montero",
      WWWHome := "https://anteromontonio.github.io/",
      Email := "antonio.montero@fmf.uni-lj.si",
      Place := "Ljubljana, Slovenia",
      Institution := "Fakulteta za Matematiko in Fiziko, Univerza v Ljubljani",
    ),

    rec(
      IsAuthor := true,
      IsMaintainer := false,
      FirstNames := "Primož",
      LastName := "Potočnik",
      WWWHome := "https://users.fmf.uni-lj.si/potocnik/",
      Email := "primoz.potocnik@fmf.uni-lj.si",
      Place := "Ljubljana, Slovenia",
      Institution := "Fakulteta za Matematiko in Fiziko, Univerza v Ljubljani",
    ),

    rec(
      LastName      := "Conder",
      FirstNames    := "Marston",
      IsAuthor      := false,
      IsMaintainer  := false,
      Email         := "m.conder@auckland.ac.nz",
      Place         := "Auckland, New Zealand",
      Institution   := "University of Auckland"),


    rec(
      LastName      := "Spiga",
      FirstNames    := "Pablo",
      IsAuthor      := false,
      IsMaintainer  := false,
      Email         := "pablo.spiga@unimib.it",
      Place         := "Milan, Italy",
      Institution   := "Università degli Studi di Milano - Bicocca"),

    rec(
      LastName      := "Verret",
      FirstNames    := "Gabriel",
      IsAuthor      := false,
      IsMaintainer  := false,
      Email         := "g.verret@auckland.ac.nz",
      Place         := "Auckland, New Zealand",
      Institution   := "University of Auckland"),
  
    rec(
      LastName      := "Wilson",
      FirstNames    := "Stephen",
      IsAuthor      := false,
      IsMaintainer  := false,
      Email         := "stephen.wilson@nau.edu",
      Place         := "Arizona, US",
      Institution   := "Northern Arizona University"),

  ],

  Status := "other",

  README_URL := 
    Concatenation( ~.PackageWWWHome, "/README.md" ),
  
  PackageInfoURL := 
    Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

  AbstractHTML   := 
    "The <span class=\"pkgname\">GraphSym</span> package contains various \
     collections of graphs with interesting symmetry properties. Each \
     collection of graphs are attained from complete or partial enumerations \
     published in international journals. This package provides functionality \
     enabling easy access to these graphs, along with several precomputed \
     properties related to many of the graphs stored within.",

  PackageDoc := rec(
    BookName  := "graphsym",
    ArchiveURLSubset := ["doc"],
    HTMLStart := "doc/chap0_mj.html",
    PDFFile   := "doc/manual.pdf",
    # the path to the .six file used by GAP's help system
    SixFile   := "doc/manual.six",
    LongTitle := "Graphs with symmetries library",
  ),

  Dependencies := rec(

    GAP := ">= 4.12.2",

    NeededOtherPackages := [["GAPDoc", ">= 1.6.6"],["Digraphs",">= 1.6.1"]],
    SuggestedOtherPackages := [],
    OtherPackagesLoadedInAdvance := [],

    ExternalConditions := []

  ),

  AvailabilityTest := ReturnTrue,

  TestFile := "tst/testall.g",

  Keywords := ["cubic","vertex-transitive","edge-transitive", "arc-transitive",
               "graphs"]

));

