class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.9.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.5/levelrail-cli-darwin-arm64"
      sha256 "e36d581b9e27ccb65cabac217ff81db5683813950be06e7611a491c4d445029c"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.5/levelrail-cli-darwin-amd64"
      sha256 "4c0abe944f0c7d9fa4b761eb582c95ec530cd7be9ccd9bd4bdf8b82c529aceae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.5/levelrail-cli-linux-arm64"
      sha256 "7d97ce2025806ba81163b887336f34420125f567022554747e8595b54c855a9e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.5/levelrail-cli-linux-amd64"
      sha256 "39db015db26662bcec21ea9f5e5cbd50ceefc61e655471a122bb34a595bfe92f"
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
