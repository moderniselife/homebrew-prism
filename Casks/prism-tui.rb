cask "prism-tui" do
  version "1.5.0"

  on_arm do
    sha256 "de8eeb8859a990c4bb8f7f6b095154309c94fa494163d6553c54d8af83ac3df3"
    url "https://github.com/moderniselife/prism/releases/download/v#{version}/prism-tui-darwin-arm64.tar.gz"
  end
  on_intel do
    sha256 "7750e3ef0f24551f3a3548962038322b26f3524a059299887eded36215fce6dd"
    url "https://github.com/moderniselife/prism/releases/download/v#{version}/prism-tui-darwin-amd64.tar.gz"
  end

  name "Prism TUI"
  desc "Manage isolated Cursor profiles from the terminal"
  homepage "https://github.com/moderniselife/prism"

  binary "prism-tui"

  postflight do
    # Binaries are unsigned; clear quarantine so Gatekeeper
    # doesn't block first run on macOS.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/prism-tui"]
  end
end
