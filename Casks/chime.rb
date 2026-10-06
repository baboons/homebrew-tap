cask "chime" do
  version "0.4.0"
  sha256 "0dba750d3f50ff307e09713dd999ca1ea7f7ff9f32fbf0826b27a8d8dbed2e45"

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
