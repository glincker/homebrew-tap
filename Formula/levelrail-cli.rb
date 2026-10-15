class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.4.0/levelrail-cli-darwin-arm64"
      sha256 "68701ea9c90c2bd7919cc5c2d53fa6845a192e9dada8fb58288cfb8dbe03c826"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.4.0/levelrail-cli-darwin-amd64"
      sha256 "7a07e2c500d9b42ab7f47113f276af48aab53f74d10e8b495fdefb635d9a9587"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.4.0/levelrail-cli-linux-arm64"
      sha256 "ea479f0f9b21f480d4de38b4a37fe272e8432c880a97dd80d1050a5acd128111"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.4.0/levelrail-cli-linux-amd64"
      sha256 "af4f6179f76054ad000044cfc08d9285f2f2aa91a4b85336241d1d834a45563e"
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
