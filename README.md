# Homebrew tap for Prism

[Prism](https://prism.mojolayers.com) runs every AI app and account side by side: separate profiles for Cursor, Claude Code, Claude Desktop and Grok Bot.

```sh
brew install --cask moderniselife/prism/prism       # the Mac app
brew install --cask moderniselife/prism/prism-tui   # the terminal app
```

Prism updates itself from inside the app. For the terminal app, run `brew upgrade --cask prism-tui`.

The casks are generated: `.github/workflows/sync.yml` reads the latest [moderniselife/prism](https://github.com/moderniselife/prism) release every hour and fills in the templates from that repo's `packaging/homebrew-cask`. Change the templates there, not the files here.
