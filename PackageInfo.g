#############################################################################
##
#W  PackageInfo.g      GRaphs with SYmmetries LIbrary        Rhys J. Evans
##
##
##
SetPackageInfo( rec(

  PackageName := "GrSyLi",
  Subtitle := "GRaphs with SYmmetries LIbrary",
  Version := "0.1",
  Date := "18/01/2024",
  License := "GPL-2.0-or-later",

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.1">
##  <!ENTITY RELEASEDATE "1 January 2024">
##  <!ENTITY PKGWWWHOME "https://rhysje00.github.io/cvt/">
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
      IsMaintainer := true,
      FirstNames := "Primož",
      LastName := "Potočnik",
      WWWHome := "https://users.fmf.uni-lj.si/potocnik/",
      Email := "primoz.potocnik@fmf.uni-lj.si",
      Place := "Ljubljana, Slovenia",
      Institution := "Fakulteta za Matematiko in Fiziko, Univerza v Ljubljani",
    ),

    rec(
      IsAuthor := true,
      IsMaintainer := true,
      FirstNames := "Antonio",
      LastName := "Montero",
      WWWHome := "https://anteromontonio.github.io/",
      Email := "antonio.montero@fmf.uni-lj.si",
      Place := "Ljubljana, Slovenia",
      Institution := "Fakulteta za Matematiko in Fiziko, Univerza v Ljubljani",
    ),

    rec(
      LastName      := "Verret",
      FirstNames    := "Gabriel",
      IsAuthor      := false,
      IsMaintainer  := false,
      Email         := "g.verret@auckland.ac.nz",
      Place         := "Auckland, New Zealand",
      Institution   := "University of Auckland"),

    rec(
      LastName      := "Spiga",
      FirstNames    := "Pablo",
      IsAuthor      := false,
      IsMaintainer  := false,
      Email         := "pablo.spiga@unimib.it",
      Place         := "Auckland, New Zealand",
      Institution   := "Università degli Studi di Milano - Bicocca"),
  
  ],

  Status := "other",

  README_URL := 
    Concatenation( ~.PackageWWWHome, "/README.md" ),
  
  PackageInfoURL := 
    Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

  AbstractHTML   := 
    "The <span class=\"pkgname\">GrSyLi</span> package contains various \
     collections of small graphs with ceratin symmetry properties, and provides \
     functionality for the access to these graphs, along with several \
     precomputed properties for each graph available.",

  PackageDoc := rec(
    BookName  := "grsyli",
    ArchiveURLSubset := ["doc"],
    HTMLStart := "doc/chap0_mj.html",
    PDFFile   := "doc/manual.pdf",
    # the path to the .six file used by GAP's help system
    SixFile   := "doc/manual.six",
    LongTitle := "GRaphs with SYmmetries LIbrary",
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

