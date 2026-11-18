class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.5/levelrail-cli-darwin-arm64"
      sha256 "a0263795327a590c79399e662ff1ddbb05b45691933d9e05e98113e846ae2082"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.5/levelrail-cli-darwin-amd64"
      sha256 "952fd90299046711d1a8f273850a943d6c56e7863753487438a3e939f2ad62f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.5/levelrail-cli-linux-arm64"
      sha256 "76aa82bb688faddbe6f54bbb67492278b8b538f7ac7c87137e8eab5bf4a30d93"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.5/levelrail-cli-linux-amd64"
      sha256 "394658a8cf187e871ce161fb70f5ebac7f22f0a7b0a94e8727079649a300fa79"
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
