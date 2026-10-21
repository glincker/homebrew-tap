class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.0/levelrail-cli-darwin-arm64"
      sha256 "f0ceb72ad5952c3e4e89d2b6decd675809654b3d67a80edbe124602c19b6ec32"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.0/levelrail-cli-darwin-amd64"
      sha256 "159c4be4a88ff27af8683d0d05d8952344a829d9883fd90b860aef20e9c4bf1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.0/levelrail-cli-linux-arm64"
      sha256 "57e32622706721b27b08ff6675235269994f4c9592b1ef5542cd0397927fc599"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.0/levelrail-cli-linux-amd64"
      sha256 "06700386df6b6c589c15048b4e484575df8c60cc40f054d92a86c048234caad4"
    end
  end

  def install
    bin.install Dir["levelrail-cli-*"].first => "levelrail-cli"
    chmod 0555, bin/"levelrail-cli"
    generate_completions_from_executable(bin/"levelrail-cli", "completion")
  end

  test do
    assert_match "scriptable client", shell_output("#{bin}/levelrail-cli help")
  end
end
