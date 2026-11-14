class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.2/levelrail-cli-darwin-arm64"
      sha256 "e8689164fd188ab657f4d604ebf6394d89acf04142d6c57fa8cc7de444c89efe"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.2/levelrail-cli-darwin-amd64"
      sha256 "d87715ede56c32302d35fdf5649710dc2ee4ae248d47eb31525c8b381375b0b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.2/levelrail-cli-linux-arm64"
      sha256 "72889702498c413bfbf1d098a4a1c2aa300be7d8d2d67b1725c2739b3d7f6101"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.1.2/levelrail-cli-linux-amd64"
      sha256 "c98df15b81c9bc7c156d785b2a1c94c09bde06c1fdcc769ac05bf23a5f3dc694"
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
