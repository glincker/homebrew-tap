class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.0/levelrail-cli-darwin-arm64"
      sha256 "efb5ef45dce1c86d05f841d0d86fd32895f7be204e97dc6fe0070a17fcb7249a"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.0/levelrail-cli-darwin-amd64"
      sha256 "fe9b9455658a8b30b225df7f853a9c8506ee2c2d017e289c1bd8a52c3550b047"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.0/levelrail-cli-linux-arm64"
      sha256 "4b5489b70f27acb782dea89aee43d04b4d8e869ad52a448a4c82af3182663b73"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.5.0/levelrail-cli-linux-amd64"
      sha256 "f9746243cb8c02462cae02b7e2c9de8b47d2805517a21626554aadb6756da5ab"
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
