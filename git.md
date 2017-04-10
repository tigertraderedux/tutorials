# Git Cheatsheet

## One-time setup

* Create the parent folder:
`mkdir -p $GOPATH/src/github.com/casey-chow`

* Go to the parent folder:
`cd $GOPATH/src/github.com/casey-chow`

* Use one of the following methods to clone the repository:

    - `git clone https://github.com/casey-chow/tigertrade.git`

    - `git clone git@github.com:casey-chow/tigertrade.git`

* Go into the repository:
`cd tigertrade`

* Get the `.env` file from the Google Drive and put it in the `tigertrade` folder.

* Set up the environment:
`make install`

## Starting work

### On your current branch

* To check for uncommitted (staged, unstaged, or untracked) changes:
`git status`

* If you have changes that have not been committed:
`git stash`

* Get updates from anyone who edited the branch since you last worked:
`git pull`

* If you used `git stash` above:
`git stash pop`

### On an existing branch

* Check for uncommitted changes:
`git status`

* If you have changes that have not been committed, stash uncommitted changes on the previously-used branch:
`git stash`

* Update the list of branches if you have not fetched or pulled since the branch was created:
`git fetch`

* Switch to the branch you want to work on:
`git checkout <branch>`

* Get the contents of the brancH:
`git pull`

* If you want to run our code, you will need to get `yarn` and `govendor` up to date:
`make install`

### On a new branch

First, move to the branch you want to branch from as above.

* Create the branch locally:
`git checkout -b <newbranch>`

* Publish the branch to the remote `origin`:
`git push --set-upstream origin <newbranch>`

## Packaging changes

* Look at the staged and unstaged changes:
`git status`

* Stage some unstaged changes:
`git add <file>...`

* Unstage some staged changes:
`git reset HEAD <file>...`

* Drop some unstaged changes (caution - this doesn't save a copy of the dropped changes):
`git checkout -- <file>...`

* Check the currently staged changes:
`git status`

* Create a commit and enter a commit message using `$EDITOR`:
`git commit`

* Alternatively, enter a commit message directly:
`git commit -m 'Message goes here'`

## Publishing changes

* Commit your changes as described above.

* Get other peoples' work:
`git pull`

* Solve merge conflicts if any exist (described below), then commit. Then `git pull` again. Repeat as necessary (e.g. if someone pushed conflicts while you were solving merge conflicts).

* Publish your changes to the remote:
`git push`

## Receiving distributed changes

* Commit and push your changes as described above.

* If you had no changes to commit, and want to merge changes from a branch created since you last fetched or pulled, you may need to update your local information about the remote branches:
`git fetch`

* Merge changes from the branch with the changes you want (base) to the branch you are working on (head):
`git merge origin/<base> <head>`

    Note that the command `git merge <base> <head>` will not merge in any changes from `<base>` that had not been pulled to your local copy of `<base>`.

* Solve merge conflicts if any exist. Use a tool of your choice (I use `smerge-ediff`) to keep either upstream changes (from the base branch) or changes from head, mixing or rewriting as appropriate.

* Commit your merge conflict resolution as described above.

* Push your merge as described above.

## Distributing changes

* Create a pull request from the branch with your changes (head) to the branch where the changes should be distributed (base). Assign yourself, request reviews, etc... as necessary.

* Alternate the following:

- Merge base into head and solve any merge conflicts as described above.

- Resolve review comments on the pull request.

- Fix test failures.

* Once the head is up to date with the base, and CI testing and reviews are both green, merge the pull request using the [github.com]() UI.
