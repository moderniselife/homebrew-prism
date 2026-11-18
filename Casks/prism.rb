cask "prism" do
  version "1.6.0"
  sha256 "9350c28a706a02db6b0d42fad49304cf9490e036a6f527d858ecf7d4c045d26d"

  url "https://github.com/moderniselife/prism/releases/download/v#{version}/Prism.app.zip"
  name "Prism"
  desc "Run every AI app and account side by side in isolated profiles"
  homepage "https://prism.mojolayers.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Prism.app"

  # Prism is ad-hoc signed, not notarised: clear quarantine so
  # Gatekeeper doesn't block the first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Prism.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.mojolayers.prism.plist",
    "~/Library/Saved Application State/com.mojolayers.prism.savedState",
  ]
end
