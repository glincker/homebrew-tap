class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.0-beta.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.20/levelrail-cli-darwin-arm64"
      sha256 "608076e4e2d7ac4e995e7233ad033a59aed55b387162a0d2cde3c6aaa13079c0"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.20/levelrail-cli-darwin-amd64"
      sha256 "b2fbbe97033d88bcd5a0429ff89f949748b17056d2621b990480af6c46bf9a67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.20/levelrail-cli-linux-arm64"
      sha256 "7c2057c0f20888849ce47a6e727a6475404b6e4da29f2a17925eadcfafe74051"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.20/levelrail-cli-linux-amd64"
      sha256 "b7f98d56e2c0bf5050cf3879f29564bf3e72366d70bac164ffd43e31eaf3a7dd"
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
