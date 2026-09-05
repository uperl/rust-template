# {{project-name}}

## Next steps

`cargo generate` leaves you with a fresh, commit-less Git repository and no
remote. To push it to GitHub:

```sh
git remote add origin git@github.com:{{gh-username}}/{{project-name}}.git
git add -A
git commit -m "initial commit"
git push -u origin main
```

The generated `set-remote.sh` runs the `git remote add` line for you (the
address is already filled in) and deletes itself once the remote is set.

Delete this section once you're set up.
