class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.10/levelrail-cli-darwin-arm64"
      sha256 "fabd7f198baf698d2df9673fe836a3aa718e6394f234e5082d97d6deec0b306f"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.10/levelrail-cli-darwin-amd64"
      sha256 "3cd2cce6180f2dcf6517291a0be454842bda161e943900eeaf91c985224e6aeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.10/levelrail-cli-linux-arm64"
      sha256 "bffb1b4161d8890abed9f42e2edd1d62b0dce894b41062d8b853c80064b0de50"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.10/levelrail-cli-linux-amd64"
      sha256 "b83da90498c3e4af76476be0ffc975a2e102f449945f2e27bfdb71ab32e7ff55"
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
