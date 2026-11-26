class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.12/levelrail-cli-darwin-arm64"
      sha256 "630d73d5065c738bde7b1aa0f97b1ccc1f27905e9ffc842e777bb93ffb180d79"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.12/levelrail-cli-darwin-amd64"
      sha256 "b2a3ff028603c7339fa65e060459ee8a901fa43bc3a738136fe756c8764a91e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.12/levelrail-cli-linux-arm64"
      sha256 "c73c8ef8b99b1f8f3e805bdb5aad6ec426140dfafd6c287556f8b3ab9d6e6e0e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.12/levelrail-cli-linux-amd64"
      sha256 "dadb79510da85a417be5db3127421fc244b5deab069f3347e2de240485895840"
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
