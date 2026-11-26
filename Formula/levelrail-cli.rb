class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.11/levelrail-cli-darwin-arm64"
      sha256 "2a0086075cee5a10075cd5a0389c28ff8d9bb4751b504fa0ad8a4afb12f86c4e"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.11/levelrail-cli-darwin-amd64"
      sha256 "6f82beb2b2719a2ca0bdcd1c925048d6317474e5655e4d28d9314e3f471ebcf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.11/levelrail-cli-linux-arm64"
      sha256 "f98d0d4526a248cbb9563e892d9c263d23eb5bd7072148cf58a204a4d6a1e47d"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.11/levelrail-cli-linux-amd64"
      sha256 "03b441eff8b342fa5a4fe3d74eb1a4bd6564793c3537f0199d43e20cde31e5aa"
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
