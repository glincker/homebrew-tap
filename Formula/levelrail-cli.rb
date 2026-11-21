class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.7/levelrail-cli-darwin-arm64"
      sha256 "362b00312c869f693ed33617aad02a4929bf6c8e31fbf9958e79db00af12a8f7"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.7/levelrail-cli-darwin-amd64"
      sha256 "991e9d83c67b60f3c25fce723eac9c6f0fa3481b93ee2ef0f8d8ba9cdab68b63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.7/levelrail-cli-linux-arm64"
      sha256 "ba4ba47f805928d2d652c89458edd7032f0a68bd96b1ecbd124ddfd4e83935f5"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.7/levelrail-cli-linux-amd64"
      sha256 "fd11074d1ae28e08006309fae66efee827b5ce46408da3d7a203b0cc7e3e0db4"
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
