// Post-generation hook.
//
// cargo-generate strips the template's `.git` directory while moving files into
// place and then runs its own `git init` as the very last step, with no hook
// after it -- so a hook cannot add a remote that survives into the new project.
// Instead we drop a `set-remote.sh` helper (address already filled in, and it
// removes itself once it succeeds) and print the commands so they're in the
// terminal scrollback.
//
// This hook only touches files, so it does NOT require `--allow-commands`.

let slug = variable::get("gh-username") + "/" + variable::get("project-name");
let ssh_url = "git@github.com:" + slug + ".git";
let https_url = "https://github.com/" + slug + ".git";

file::write("set-remote.sh", `#!/bin/sh
# Point this repository at GitHub, then delete this script.
# For HTTPS instead of SSH, swap in: ${https_url}
set -eu
git remote add origin ${ssh_url}
echo "origin -> $(git remote get-url origin)"
rm -- "$0"
`);

print("");
print("  Next steps -- push this project to GitHub:");
print("");
print(`    sh set-remote.sh          # git remote add origin ${ssh_url}`);
print("    git add -A");
print("    git commit -m 'initial commit'");
print("    git push -u origin main");
print("");
