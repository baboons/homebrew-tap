cask "snipster" do
  version "0.1.0"
  sha256 "efc547aac8e401852df10fcbb15d3d7a2816f8b5966c8f2d5ac544c1ae029482"

  url "https://github.com/baboons/snipster/releases/download/v#{version}/Snipster-aarch64-apple-darwin.zip"
  name "Snipster"
  desc "Screenshot tool with annotations, window frames and scrolling capture"
  homepage "https://github.com/baboons/snipster"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Snipster.app"

  # Signed with Snipster's own certificate but not notarized (no Developer ID).
  # Clear the download quarantine before the app moves into place, or
  # Gatekeeper refuses the first launch.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Snipster.app"], chdir: "."
  end

  uninstall quit: "com.baboons.snipster"

  zap trash: "~/Library/Preferences/com.baboons.snipster.plist"
end
