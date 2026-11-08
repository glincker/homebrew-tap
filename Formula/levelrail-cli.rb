class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.9.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.3/levelrail-cli-darwin-arm64"
      sha256 "47bb677613e9335327b4287d966215b6c747f1f466101580d42f379f50e35d26"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.3/levelrail-cli-darwin-amd64"
      sha256 "d55d40d52435ddb6498c888e9013430fdb5ff350a5e866bf74455539655ec140"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.3/levelrail-cli-linux-arm64"
      sha256 "673c8b1f196c41a6474acf60a6b755b630d9e4e284e5b4961430a88ad6440a1d"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.3/levelrail-cli-linux-amd64"
      sha256 "cf9be2237ff2b4a020ae95473737e0760245cbc9e3400e1f2a5057f59a8b056c"
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
