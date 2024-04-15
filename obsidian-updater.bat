rem Navigate to the folder you want to commit
cd /d "C:\Users\jack.duggan\OneDrive - SAGE\Documents\work_vault"

rem Check if there are any changes in the repository
git status | findstr /R "modified added deleted" > nul
if %errorlevel% equ 0 (
    rem Add all changes in the folder to the staging area
    git add .
    
    rem Get the current date in MM/DD/YYYY format
    for /F "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
    set current_date=%datetime:~4,2%/%datetime:~6,2%/%datetime:~0,4%
    
    rem Print the current date
    echo Current date: %current_date%

    rem Commit changes with the current date as the commit message
    git commit -m "- %current_date%"
    
    rem Push changes to the remote repository
    git push origin main
) else (
    echo No changes to commit.
)