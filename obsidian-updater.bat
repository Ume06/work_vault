rem Navigate to the folder you want to commit
cd /d "C:\Users\jack.duggan\OneDrive - SAGE\Documents\work_vault"

rem Check if there are any changes in the repository
git status | findstr /R "modified added deleted" > nul
if %errorlevel% equ 0 (
    rem Add all changes in the folder to the staging area
    git add .

    rem Commit changes with the current date as the commit message
    git commit -m "- %date%"
    
    rem Push changes to the remote repository
    git push origin main
) else (
    echo No changes to commit.
)