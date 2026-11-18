cask "prism-tui" do
  arch arm: "arm64", intel: "amd64"

  version "1.6.0"
  sha256 arm:   "8e83c4f68e5fada6e17e13b184a35d09e3d919636ef8e921efe85bc5ae24cdd2",
         intel: "ef02987af29badd49b4b5afb386b1c62767d925d3977bbebfa1754f28ac47035"
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
