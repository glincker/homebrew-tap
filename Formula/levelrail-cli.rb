class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.7/levelrail-cli-darwin-arm64"
      sha256 "0513a48b9f788320e13c8b2efda07f1639ee7bf906e332a52b5e0993c4469d86"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.7/levelrail-cli-darwin-amd64"
      sha256 "57ec1826c1784aa53b45ddcc5742123b88076d867098e2518102cef262a5d1b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.7/levelrail-cli-linux-arm64"
      sha256 "c27183ecb5f38e7fc9d0fd4507d8ecbc93d847867fb0a544ca19b3ed07dfab38"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.7/levelrail-cli-linux-amd64"
      sha256 "27001278eea48b57dcb35284b7c4f03eff1bde3f0a49dc48f6e8bd87d1ab65f0"
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
