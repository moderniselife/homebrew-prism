cask "prism" do
  version "1.5.1"
  sha256 "0e64f46732ac352d28b714978753bd8340b37b16e777a63cc4976f0dd176bb77"

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
