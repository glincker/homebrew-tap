class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.2/levelrail-cli-darwin-arm64"
      sha256 "5c3d59c6b7c03eb27e01d508ff6179e3cb58f420ad0fbe7d16290f8e0a311eb5"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.2/levelrail-cli-darwin-amd64"
      sha256 "e121f58da89080a3829891dc63ed9d52aa04f0fe612a5359cf7a3e980e040eb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.2/levelrail-cli-linux-arm64"
      sha256 "58cba2ea3afcaf56f9928d79384034ad1b27d898302c9728a58a8d8afc9c959f"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.0.2/levelrail-cli-linux-amd64"
      sha256 "6e4cac63da001d6863ad1592c043e38a09bf7276fd271db372b202246c54b190"
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
