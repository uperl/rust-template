# rust-template

A [cargo-generate](https://cargo-generate.github.io/cargo-generate/) template for
starting a new Rust project (binary or library) with CI and release automation
wired up from the first commit.

## What you get

- `Cargo.toml` on the 2024 edition with [`anyhow`](https://crates.io/crates/anyhow)
  as a dependency and, for binaries, [`cargo-deb`](https://crates.io/crates/cargo-deb)
  metadata for building `.deb` packages.
- MIT `LICENSE`.
- GitHub Actions CI (`.github/workflows/ci.yml`) via
  [`uperl/action-rust-ci`](https://github.com/uperl/action-rust-ci).
- GitHub Actions release automation (`.github/workflows/release.yml`):
  - binaries use
    [`uperl/action-rust-release-bin`](https://github.com/uperl/action-rust-release-bin)
  - libraries use
    [`uperl/action-rust-release-lib`](https://github.com/uperl/action-rust-release-lib)
- A starter `src/main.rs` (binary) or `src/lib.rs` (library) — the one you don't
  pick is removed automatically.

## Usage

Install `cargo-generate` if you don't have it:

```sh
cargo install cargo-generate
```

Generate a new project:

```sh
cargo generate --git https://github.com/uperl/rust-template.git
```

You'll be prompted for:

| Placeholder           | Description                          | Default  |
|-----------------------|--------------------------------------|----------|
| `project-name`        | Name of the crate                    | —        |
| `gh-username`         | GitHub username or organization      | `uperl`  |
| `project-description` | Short description of the project     | —        |
| `project-publisher`   | Publisher name (used for releases)   | `uperl`  |
| `crate_type`          | `bin` or `lib`                       | —        |

## License

MIT — see [LICENSE](LICENSE).
