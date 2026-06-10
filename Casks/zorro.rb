cask "zorro" do
  version "0.0.1"
  sha256 "48631922f802c19f2259cafb3d72235bfe7f833ce3b7f86dc209a5e5ff90ec77"

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
