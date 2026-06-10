cask "zorro" do
  version "0.1.0"
  sha256 :no_check # auto-pinned by .github/workflows/bump-cask.yml on the first release bump

  url "https://github.com/baboons/zorro/releases/download/v#{version}/Zorro-aarch64-apple-darwin.zip"
  name "Zorro"
  desc "Fast, native macOS Git merge-conflict resolver"
  homepage "https://github.com/baboons/zorro"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Zorro.app"
  # `zorro` on the PATH opens the app on the current repo (see the bundled CLI).
  binary "#{appdir}/Zorro.app/Contents/Resources/zorro"

  zap trash: "~/Library/Saved Application State/dev.zorro.app.savedState"
end
