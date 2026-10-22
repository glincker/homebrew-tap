class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.1/levelrail-cli-darwin-arm64"
      sha256 "022f7b25e257d36b3cf30c8c4d403d3a574b92f3c14e7557a50e2f422249f202"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.1/levelrail-cli-darwin-amd64"
      sha256 "a52bff2fa25ba4b8316cbe37401ac4edae79eed5c2c50a0d30e6ca661bec481c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.1/levelrail-cli-linux-arm64"
      sha256 "8d5aac63b6faa33f88b7c46d9caca4b268e5f381058e98f363e60ba2e9e9f99c"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.1/levelrail-cli-linux-amd64"
      sha256 "5a581cca46c12afc49d229043f2964c8dddf0f4a24a8b0e0dabcfdfa0fa7d31f"
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
