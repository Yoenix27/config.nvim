if exists("current_compiler")
  finish
endif
let current_compiler = "csharp"

if !filereadable('Makefile') && !filereadable('makefile')
    " Use dotnet build for .NET projects
    if filereadable('*.csproj')
        CompilerSet makeprg=dotnet\ build
    else
        " For directories without project file, create one and build
        CompilerSet makeprg=dotnet\ new\ console\ --force\ &&\ dotnet\ build
    endif
endif

" Error format for C# compiler output
CompilerSet errorformat=
      \%f(%l\\,%c):\ %trror\ CS%n:\ %m,
      \%f(%l\\,%c):\ %tarning\ CS%n:\ %m,
      \%f(%l\\,%c):\ %m,
      \%f(%l):\ %trror\ CS%n:\ %m,
      \%f(%l):\ %tarning\ CS%n:\ %m,
      \%f(%l):\ %m,
      \%-G%.%#Build\ FAILED.,
      \%-G%.%#Time%.%#,
      \%-G%.%#
