class SshToAge < Formula
  desc "Convert SSH keys to age keys"
  homepage "https://github.com/Mic92/ssh-to-age"
  url "https://github.com/Mic92/ssh-to-age/archive/refs/tags/v1.1.5.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
