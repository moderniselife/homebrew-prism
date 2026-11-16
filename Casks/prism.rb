cask "prism" do
  version "1.5.0"
  sha256 "3fe68d9e564ca7ee9408fb2352df078285eca932079d3a097f12027a1bb6a19e"

  url "https://github.com/moderniselife/prism/releases/download/v#{version}/Prism.app.zip"
  name "Prism"
  desc "Run every AI app and account side by side in isolated profiles"
  homepage "https://prism.mojolayers.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Prism.app"

  postflight do
    # Prism is ad-hoc signed, not notarised: clear quarantine so
    # Gatekeeper doesn't block the first launch.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Prism.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.mojolayers.prism.plist",
    "~/Library/Saved Application State/com.mojolayers.prism.savedState",
  ]
end
