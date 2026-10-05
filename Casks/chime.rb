cask "chime" do
  version "0.3.0"
  sha256 "5368b5dc0616d3cce8c01f8ca1306113966ec1b30b742119806563f66f9b6581"

  url "https://github.com/baboons/chime/releases/download/v#{version}/Chime-aarch64-apple-darwin.zip"
  name "Chime"
  desc "Shows your apps in the menu bar when they have notifications"
  homepage "https://github.com/baboons/chime"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Chime.app"

  # Signed with Chime's own certificate but not notarized (no Developer ID).
  # Clear the download quarantine before the app moves into place, or
  # Gatekeeper refuses the first launch.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Chime.app"], chdir: "."
  end

  uninstall quit: "com.baboons.chime"

  zap trash: [
    "~/Library/Application Support/Chime",
    "~/Library/Preferences/com.baboons.chime.plist",
  ]
end
