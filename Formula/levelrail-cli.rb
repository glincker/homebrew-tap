class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.1/levelrail-cli-darwin-arm64"
      sha256 "8a2279d3db75ccd947b731786ee47959ab8d621926cc7c6ad82fbbfeac4bac8c"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.1/levelrail-cli-darwin-amd64"
      sha256 "4f2363279fa779ace7a4cf6c8c2ad0ebbd355396c656968abcf30e32f1fdd4d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.1/levelrail-cli-linux-arm64"
      sha256 "b6a7543f0a035772a33687e6d73d6a2c14e8321284c9457731a236c086acdced"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.3.1/levelrail-cli-linux-amd64"
      sha256 "66befcf6a46ccf29498ce9d304cdc7ec909781eed014a7e77c9caf65799a0adb"
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
