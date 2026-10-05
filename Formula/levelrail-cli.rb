class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.0-beta.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.17/levelrail-cli-darwin-arm64"
      sha256 "9e343da0c4b1b555dadb975ed4e22755fc210307cf1eda2e68c6ae3ec8ffe2ec"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.17/levelrail-cli-darwin-amd64"
      sha256 "cce70b20ea231ad99e6c71a94a92ff45a1d30b0957701c663dc1cdd555c80d62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.17/levelrail-cli-linux-arm64"
      sha256 "1ddecc091d2b81df4fa4c37805309dcbc79fc0e02a79254b440af9006dfc96ab"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.17/levelrail-cli-linux-amd64"
      sha256 "6b83e717ea8d2425135c1ef0ea1d629d3f3930cc7646fcc7e16670045aeada57"
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
