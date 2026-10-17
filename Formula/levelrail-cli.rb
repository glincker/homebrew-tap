class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.6.0/levelrail-cli-darwin-arm64"
      sha256 "89e6f8237371b9ccb7b342cb8bf89ac6e90dbaa166ac0a47f895e7803e755413"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.6.0/levelrail-cli-darwin-amd64"
      sha256 "031d80216b24b40cfa699862e147bb0d2ac008aa28a027d9a11279c4c3fe0d05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.6.0/levelrail-cli-linux-arm64"
      sha256 "52640c1fcc84c85ff4c93614dd0e85f2e63741ec8259770ac7a2eedbdd34631d"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.6.0/levelrail-cli-linux-amd64"
      sha256 "f1d7ea39d22929fe2ac5b197010e77bf6cfb25f7ab4b68f3c9cf1459c3681c98"
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
