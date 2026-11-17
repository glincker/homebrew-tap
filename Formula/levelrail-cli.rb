class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.1/levelrail-cli-darwin-arm64"
      sha256 "e068efbb18240a397f85758ddabb1fd5e7e76dc2ba8e17b6b6258dcbba785982"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.1/levelrail-cli-darwin-amd64"
      sha256 "80309b1e4c7c483cd5f005265d9e53d71129af31be98ffb36183228f2c1f6ddb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.1/levelrail-cli-linux-arm64"
      sha256 "ca0dd6bb2d7c5feafddf3a97f52b015cf2a3e07cde7bae676259d74708d2e74b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.4.1/levelrail-cli-linux-amd64"
      sha256 "e1d2e1c1608bb382930a7b4453d48596833f4e12b7067f7a5afa997bf5e4cc96"
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
