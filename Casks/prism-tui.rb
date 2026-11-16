cask "prism-tui" do
  arch arm: "arm64", intel: "amd64"

  version "1.5.0"
  sha256 arm:   "de8eeb8859a990c4bb8f7f6b095154309c94fa494163d6553c54d8af83ac3df3",
         intel: "7750e3ef0f24551f3a3548962038322b26f3524a059299887eded36215fce6dd"

  url "https://github.com/moderniselife/prism/releases/download/v#{version}/prism-tui-darwin-#{arch}.tar.gz"

  name "Prism TUI"
  desc "Terminal app for running AI apps and accounts in isolated profiles"
  homepage "https://prism.mojolayers.com/"

  binary "prism-tui"

  # The binary is unsigned: clear quarantine so Gatekeeper
  # doesn't block the first run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/prism-tui"]
  end
end
