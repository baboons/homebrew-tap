class SshToAge < Formula
  desc "Convert SSH keys to age keys"
  homepage "https://github.com/Mic92/ssh-to-age"
  url "https://github.com/Mic92/ssh-to-age/archive/refs/tags/1.2.0.tar.gz"
  sha256 "253ba51a8224371019efb95ec0164f7b1a35413e4473fe0135aed320e09f0671"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "#{bin}/ssh-to-age", "--version"
  end
end
