git lfs prune --verbose --verify-remote
gwinmerge
gwinmerge --staged
git push --force
git show -p "stash@{0}"
git show "stash@{0}"
DT="2022-03-20T11:11:11-07:00"; GIT_AUTHOR_DATE="$DT" git commit --amend --no-edit --allow-empty --date "$DT"; GIT_COMMITTER_DATE="$DT" git commit --no-edit --amend --allow-empty --date "$DT"
DT=`git log --max-count=1 --pretty=format:'%ai' HEAD`; GIT_AUTHOR_DATE="$DT" git commit --amend --no-edit --allow-empty --date "$DT"; GIT_COMMITTER_DATE="$DT" git commit --amend --allow-empty --date "$DT"git init
git reflog expire --expire=now --all
git reflog expire --expire=now --all  && git gc --aggressive --prune=now
git rebase -i --committer-date-is-author-date --force-rebase 
git branch --all
git switch release 
np ~/.bashrc 
explorer .
git reflog show stash
git stash pop "stash@{2}"
git restore --staged 
git fetch origin
git pull
np scripts/ex-gwf-curvilinear.py
git switch -c fix-curvilinear-notebook-title
git rebase --abort
git rebase --continue 
gwinmerge 
glog --all
git remote -v
git remote -vv
git push gitlab
git push gitlab --all
gtrack .gitattributes
git add .gitattributes 
git log -1
git log -6
git stash list
git stash show
git stash list
git stash help
git stash --help
git stash show
clear
git switch release
git status
git init
git stash pop
git rm --cached **
git branch
git branch -v
