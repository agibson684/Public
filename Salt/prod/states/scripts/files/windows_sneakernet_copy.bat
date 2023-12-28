@echo Find a drive that has a folder titled POOL.
@for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do @if exist %%a:\pool\ set POOLDRIVE=%%a
@echo The Images folder is on drive: %POOLDRIVE%
@dir %POOLDRIVE%:\pool /w
@echo Find a drive that has a folder titled Videos.
@for %%b in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do @if exist "%%b:\Videos\TV Shows\" set "VIDEODRIVE=%%b"
@echo The Videos folder is on drive: %VIDEODRIVE%
@dir %VIDEODRIVE%:\pool /w
@echo Find a drive that has a folder titled Movies.
@for %%c in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do @if exist %%c:\Videos\Movies\ set MOVIEDRIVE=%%c
@echo The Videos folder is on drive: %MOVIEDRIVE%
@dir %MOVIEDRIVE%:\pool /w

xcopy /s/z/v  %POOLDRIVE%:\pool\MOVIES "%MOVIEDRIVE%:\Videos\Movies"
xcopy /s/z/v  %POOLDRIVE%:\pool\TV_SHOWS "%VIDEODRIVE%:\Videos\TV Shows"
xcopy /s/z/v  %POOLDRIVE%:\media\tv "%VIDEODRIVE%:\Videos\TV Shows"
xcopy /s/z/v  %POOLDRIVE%:\media\sync_tv "%VIDEODRIVE%:\Videos\TV Shows"
xcopy /s/z/v  %POOLDRIVE%:\media\files_movies "%MOVIEDRIVE%:\Videos\MOVIES"
xcopy /s/z/v  %POOLDRIVE%:\media\sync_movies "%MOVIEDRIVE%:\Videos\MOVIES"


   # /s/e - recursive copy, including copying empty directories.
   # /v - add this to verify the copy against the original. slower, but for the paranoid.
   # /h - copy system and hidden files.
   # /k - copy read-only attributes along with files. otherwise, all files become read-write.
   # /x - if you care about permissions, you might want /o or /x.
   # /y - don't prompt before overwriting existing files.
   # /z - if you think the copy might fail and you want to restart it, use this. It places a marker on each file as it copies, so you can rerun the xcopy command to pick up from where it left off.

