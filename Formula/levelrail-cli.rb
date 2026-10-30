class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.8/levelrail-cli-darwin-arm64"
      sha256 "a069d846178957782e99e734bc5abb5e82ffee2b015b7cc2086a63484764909e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.8/levelrail-cli-darwin-amd64"
      sha256 "af6aeea2f883e4b35c25358e764d5ab0b551f8f7f4a3a7b875117c6bb8bc0cd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.8/levelrail-cli-linux-arm64"
      sha256 "bd4d0c706007968a4b1d3e12ae367b479402ff9b3c6e38ef6793f1ac33e4a406"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.8/levelrail-cli-linux-amd64"
      sha256 "a622adbf85109b62a1d7d7ccd858abbba5805c51085e535059f2c8af4b5c36c8"
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
