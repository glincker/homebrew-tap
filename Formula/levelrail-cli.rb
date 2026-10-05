class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.0-beta.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.18/levelrail-cli-darwin-arm64"
      sha256 "8fa9ba53568e718c0dcee6f9bd0583a07f41a6b2a8dd17d6d7330d8fa1bec5f8"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.18/levelrail-cli-darwin-amd64"
      sha256 "1704262107163e7f518f507888f1809fcfc3b922ad3093c71eb739cb87760031"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.18/levelrail-cli-linux-arm64"
      sha256 "0780c631caae3bd735d18ea588b9dc516879ed18797c6aeafaaf25f5a61cbed3"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0-beta.18/levelrail-cli-linux-amd64"
      sha256 "dd751a840d1d2b0e8c26c0b7d8a384e924d8a07bd03027cc0a5b420e4b5d0bde"
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
