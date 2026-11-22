class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.8/levelrail-cli-darwin-arm64"
      sha256 "eb175a40f29932a6e628616e6729b95ca16b335421be480efeef4d0d19b9f580"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.8/levelrail-cli-darwin-amd64"
      sha256 "caaf712c7b1469998c99b5b3af6c85e3eb4f998001ca21b988f0a9ba660d7b98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.8/levelrail-cli-linux-arm64"
      sha256 "3017d009e09e9cdd4f7c3c7fcf3e3a0fefaa82add478791519bb25eeac6e75d3"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.8/levelrail-cli-linux-amd64"
      sha256 "cc95722f9bf88fcc56df6f4926408574f35da45e46adaab5d051cf81668c68bf"
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
