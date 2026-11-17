class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.0/levelrail-cli-darwin-arm64"
      sha256 "02bf9f2667a5a812c983a0355277651d8760e425b2aa39f5897670515dc95bd0"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.0/levelrail-cli-darwin-amd64"
      sha256 "3e3f92a600e6f7bfe9515f3c5088d93ddaa708bfb940d2d2148e8a17053f1c36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.0/levelrail-cli-linux-arm64"
      sha256 "9aefb0d0d922403539d8b8baa7fecff4a747a045ecb0c22f51ff09b23a32493b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.0/levelrail-cli-linux-amd64"
      sha256 "5609ea0c4ba1f211831c4747191d1353288a458b6500cca8aec2d62f8dc79a6a"
    end
  end

  def install
    bin.install Dir["levelrail-cli-*"].first => "levelrail-cli"
    chmod 0555, bin/"levelrail-cli"
    generate_completions_from_executable(bin/"levelrail-cli", "completion")
  end

  test do
    assert_match "deploy and run apps on your servers", shell_output("#{bin}/levelrail-cli help")
  end
end
