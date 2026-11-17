cask "prism-tui" do
  arch arm: "arm64", intel: "amd64"

  version "1.5.1"
  sha256 arm:   "1b990091046a3ed6e8d037863bb7fe3a4db8d45f37122529d2f8853a16732958",
         intel: "3205089f5e1d33b1d51866693fd0ab4d097b171c9321dec5c1dc7ee2842ebfaa"
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
