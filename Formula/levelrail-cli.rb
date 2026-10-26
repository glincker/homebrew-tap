class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.5/levelrail-cli-darwin-arm64"
      sha256 "d0699482e0d7cabf85827bfe82cd8c785aed8bcc216c214611c93a3312572524"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.5/levelrail-cli-darwin-amd64"
      sha256 "8fa6e1bf4c0905676acd0c8b2d8ec44d851fe1da4f371c8befe2b6c82ee8d005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.5/levelrail-cli-linux-arm64"
      sha256 "1c99f0bd5be9416c4ea0cf1c3e7282266e5e9a0293878275bfb158a9358ed22f"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.8.5/levelrail-cli-linux-amd64"
      sha256 "7b5257490fd7c86476be609cd8918b0758b6576636468d75cc6e39c6e9b0ff88"
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
