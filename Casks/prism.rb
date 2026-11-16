cask "prism" do
  version "1.5.0"
  sha256 "3fe68d9e564ca7ee9408fb2352df078285eca932079d3a097f12027a1bb6a19e"

  url "https://github.com/moderniselife/prism/releases/download/v#{version}/Prism.app.zip"
  name "Prism"
  desc "Manage isolated Cursor profiles"
  homepage "https://github.com/moderniselife/prism"

  app "Prism.app"
end
