cask "cmdtab" do
  version "0.3.0"
  sha256 "f238132cc4c30ff2fc4985f85cc868e37bb6a57474b1930396ceaa248c0a9149"

  url "https://github.com/baboons/cmdtab/releases/download/v#{version}/CmdTab-aarch64-apple-darwin.zip"
  name "CmdTab"
  desc "Window switcher with live previews and type-to-search"
  homepage "https://github.com/baboons/cmdtab"

  livecheck do
    url :url
    strategy :github_latest
  end

  # CmdTab updates itself; `brew upgrade` leaves it alone unless --greedy.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "CmdTab.app"

  # Signed with CmdTab's own certificate but not notarized (no Developer ID).
  # Clear the download quarantine before the app moves into place, or
  # Gatekeeper refuses the first launch.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "CmdTab.app"], chdir: "."
  end

  uninstall quit: "app.cmdtab.CmdTab"

  zap trash: [
    "~/Library/Application Support/CmdTab",
    "~/Library/Preferences/app.cmdtab.CmdTab.plist",
  ]
end
