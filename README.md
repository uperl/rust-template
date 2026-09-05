# rust-template

A [cargo-generate](https://cargo-generate.github.io/cargo-generate/) template for
starting a new Rust project (binary or library) with CI and release automation
wired up from the first commit.

## What you get

- `Cargo.toml` on the 2024 edition with [`anyhow`](https://crates.io/crates/anyhow)
  as a dependency and, for binaries, [`cargo-deb`](https://crates.io/crates/cargo-deb)
  metadata for building `.deb` packages.
- MIT `LICENSE`.
- GitHub Actions CI (`.github/workflows/ci.yml`) that calls the reusable workflow
  from [`uperl/action-rust-ci`](https://github.com/uperl/action-rust-ci), running
  on pushes to `main` and on pull requests.
- GitHub Actions release automation (`.github/workflows/release.yml`), running on
  pushes to `main`:
  - binaries call the reusable workflow from
    [`uperl/action-rust-release-bin`](https://github.com/uperl/action-rust-release-bin)
  - libraries check out the repo and run
    [`uperl/action-rust-release-lib`](https://github.com/uperl/action-rust-release-lib)
    with `create-release: true`
- A starter `src/main.rs` (binary) or `src/lib.rs` (library) — the one you don't
  pick is removed automatically.
- A `set-remote.sh` helper and a "Next steps" section in the project `README.md`,
  both with the GitHub remote URL already filled in from the GitHub username and
  crate name.

## Usage

Install `cargo-generate` if you don't have it:

```sh
cargo install cargo-generate
```

Generate a new project, passing `--bin` for an executable or `--lib` for a
library:

```sh
cargo generate --git https://github.com/uperl/rust-template.git --bin
```

`cargo-generate` asks for the crate name, then the template prompts for:

| Prompt                              | Used for                                                              | Default |
|-------------------------------------|----------------------------------------------------------------------|---------|
| GitHub username (or organization)   | `repository` URL in `Cargo.toml`                                     | `uperl` |
| Project description                 | `description` in `Cargo.toml` (and the `.deb` metadata for binaries) | —       |
| Project publisher                   | publisher name for release automation                                | `uperl` |

The `--bin` / `--lib` flag sets `crate_type`, which decides whether `src/main.rs`
or `src/lib.rs` is kept.

### After generating

`cargo generate` initializes a fresh Git repository but adds no commits and no
remote. The generated project explains the remaining steps in its `README.md`;
the short version:

```sh
sh set-remote.sh                    # git remote add origin git@github.com:<user>/<name>.git
git add -A
git commit -m "initial commit"
git push -u origin main
```

cargo-generate strips the template's `.git` directory and runs its own `git init`
last, with no hook after it, so the template can't add the remote directly — it
can only hand you the pre-filled command. The `post` hook that writes
`set-remote.sh` only touches files, so it does not require `--allow-commands`.

## License

MIT — see [LICENSE](LICENSE).
