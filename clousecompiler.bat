@echo off
setlocal EnableDelayedExpansion

REM JavaScript code Batch Compiler.
REM TODO: clousecompiler file1,file2,... output.js
REM TODO: clousecompiler file1 file2 ... output.js

if not "%~1"=="" (
    set list_file=%1
) else goto :help

if not "%~2"=="" (
    set target_path=%2
) else goto :help

set clouser_compiler_command=C:\compiler.jar

(for /f "usebackq eol=;" %%a in ("%list_file%") do (
  type "%%a"
  echo.
)) >"%list_file%-temp.js"
goto :compiler

:compiler
java -jar %clouser_compiler_command% --js "%list_file%-temp.js" --js_output_file "%target_path%"
goto :clean

:clean
del "%list_file%-temp.js"
goto :eof

:help
echo [USAGE]:
echo     clousecompiler inputListFile outputFile
echo.
echo [PARAMETERS]
echo     inputListFile:
echo         List of source code files, each line specifies a file path.
echo         Beginning with a semicolon is a comment.
echo.
echo     outputFile:
echo         Path of the compiled object file.
goto :eof
