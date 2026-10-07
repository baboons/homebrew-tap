cask "cmdtab" do
  version "0.3.1"
  sha256 "8cfff3433032b89b238ea8c609254465d292a6281b6d3daf2b97a36fb05fd95c"

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
