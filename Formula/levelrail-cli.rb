class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0/levelrail-cli-darwin-arm64"
      sha256 "11b5cacddc8142c837680a104b732b9dc5e6f630d4bf10dc6a10d7f876cb1c3d"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0/levelrail-cli-darwin-amd64"
      sha256 "ca6f74ab6159a1cb2e45d223aaa271442e7c8d425e49594f6306286621b8fbd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0/levelrail-cli-linux-arm64"
      sha256 "24f6fc40e9e28c3d9857f9ce9626e819536548318c04c35f8aeefdc14599ddac"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v0.2.0/levelrail-cli-linux-amd64"
      sha256 "febdaa0a7709b8045482b2123de1f2b617cf785521ea1c16d3e9ea75b2cbf402"
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
