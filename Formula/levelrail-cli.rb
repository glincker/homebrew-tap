class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.0-beta.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.16/levelrail-cli-darwin-arm64"
      sha256 "05731779cf9c9e32c6d4665412ca84c0cf397222220232c36bc886227fd4f34e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.16/levelrail-cli-darwin-amd64"
      sha256 "70b3ccb9d6d08721ac5d0e7be9cc9b29d87e422e3a2b3ab5f06121621f6b3553"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.16/levelrail-cli-linux-arm64"
      sha256 "7fa84df93426919da4c8d9a6675f81a7cb9942825387805fbc5f634783e36421"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.16/levelrail-cli-linux-amd64"
      sha256 "a46980caa7020d120e856ad142453d204f70258910518c32e3550768bfba589a"
    end
  end

  def install
    bin.install Dir["levelrail-cli-*"].first => "levelrail-cli"
    generate_completions_from_executable(bin/"levelrail-cli", "completion")
  end

  test do
    assert_match "scriptable client", shell_output("#{bin}/levelrail-cli help")
  end
end
