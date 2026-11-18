class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.4/levelrail-cli-darwin-arm64"
      sha256 "5c9f115a2a28e2aa67aa081dd639cb6a248d754a8c5927d1a15f7b16804d265e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.4/levelrail-cli-darwin-amd64"
      sha256 "81a5198fcaa164d6dbd3eb82836275f5b675c828f1c6b62cc98277c653fb6ed5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.4/levelrail-cli-linux-arm64"
      sha256 "242f27edc44f5e2899a84c2e567c112a0475e4420827813529c55b31b1606eaf"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.4/levelrail-cli-linux-amd64"
      sha256 "9e02f61749c2b7f1bd0152090306e186895ffdaa91c2cd543061b8f2862696e3"
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
