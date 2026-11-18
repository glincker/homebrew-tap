class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.2/levelrail-cli-darwin-arm64"
      sha256 "f32d683d8675d4d7f1a5aee3ccdd58c6607dda31ac4737d6f03230fec70a58a3"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.2/levelrail-cli-darwin-amd64"
      sha256 "08729ab6f85e1ba2418c64dda9c03f856c129c0da526ab0a62c8b1515647c5ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.2/levelrail-cli-linux-arm64"
      sha256 "c87a060d73c1c57efeba164feb2cb798c9cd5bd1ef97f28b091a651f22da5383"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.2/levelrail-cli-linux-amd64"
      sha256 "b23e0bf2fbf08fb244de6083e80c3122f25ff9a14aa15994e46c6ad2a917b355"
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
