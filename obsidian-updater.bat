rem Navigate to the folder you want to commit
cd /d "C:\Users\jack.duggan\OneDrive - SAGE\Documents\work_vault"

rem Check if there are any changes in the repository
git status | findstr /R "modified added deleted" > nul
if %errorlevel% equ 0 (
    rem Add all changes in the folder to the staging area
    git add .
    
    rem Get the current date in MM/DD/YYYY format
    for /F "tokens=1* delims=" %%A in ('date/t') do set datetime=%%B
    for /F "tokens=1,2 eol=/ delims=/" %%A in ('date/t') do set mm=%%B
    for /F "tokens=2,2 eol=/ delims=/" %%A in ('echo %cdate%') do set dd=%%B
    for /F "tokens=2,3 delims=/" %%A in ('echo %cdate%') do set yyyy=%%B
    set current_date=%mm%%dd%%yyyy%
    
    rem Print the current date
    echo Current date: %current_date%

    rem Commit changes with the current date as the commit message
    git commit -m "- %current_date%"
    
    rem Push changes to the remote repository
    git push origin main
) else (
    echo No changes to commit.
)