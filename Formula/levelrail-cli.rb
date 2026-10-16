class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.1/levelrail-cli-darwin-arm64"
      sha256 "6434d3aca0b4c68ccdee2c475287b7241c1f06bcf94499468257f2de5d6bf895"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.1/levelrail-cli-darwin-amd64"
      sha256 "fc24a35032b506118daeed1e84803bb9a0e813d779e74326b9bdcec200397e59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.1/levelrail-cli-linux-arm64"
      sha256 "52f367461628e90ff65af39f33fc1b981149d017a49fa041d530805159b97ca6"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.1/levelrail-cli-linux-amd64"
      sha256 "49322b6a5d5c9b288f668423ba884ccf81c01aafed5597aaac75f732f5214322"
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
