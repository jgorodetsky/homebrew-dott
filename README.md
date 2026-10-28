# homebrew-dott

The Homebrew tap for [dott](https://github.com/jgorodetsky/dott), one fuzzy picker for your dotfiles.

```sh
brew trust --formula jgorodetsky/dott/dott   # Homebrew 6+: load this one formula from this tap
brew install jgorodetsky/dott/dott
```

`scripts/release.sh` in the dott repo updates `Formula/dott.rb` for each release. CI audits the formula, builds it from source and runs its test.
