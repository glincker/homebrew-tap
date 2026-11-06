class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.2/levelrail-cli-darwin-arm64"
      sha256 "7b0a8bf0ac183485f671e56386b3b7aba8f9930c62705009f1168a3723ba6f4b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.2/levelrail-cli-darwin-amd64"
      sha256 "c21d5563d811a1f47c6bd2ecad17b08dfde4d8a3de9ec9f419885c0c9dd15e3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.2/levelrail-cli-linux-arm64"
      sha256 "b9335baede7f62456898a16079317f1fb767c8c2ca9e32498b38bed69da5f838"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.9.2/levelrail-cli-linux-amd64"
      sha256 "907bc8464289cbe1e61214777e3d4525a21fecfc66e27484e5a78dc5039c6869"
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
