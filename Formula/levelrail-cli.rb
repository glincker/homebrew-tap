class LevelrailCli < Formula
  desc "Command line client for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.13/levelrail-cli-darwin-arm64"
      sha256 "97f6f5c12f398285eb0c9f9243bd53d913368bb759128fbcbb785ea39abbed9b"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.13/levelrail-cli-darwin-amd64"
      sha256 "2757d31f20785745a5f26c5c2889e82ef7ffa14c015cae5b5eac5d5782a52249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.13/levelrail-cli-linux-arm64"
      sha256 "c5086306129b8a35668f766787c997b457f9bfbf9fa46c5cba771c7faeb490b1"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.13/levelrail-cli-linux-amd64"
      sha256 "e9504715d0badfd7bae5e9bfe304e43ec0cc48db7c98a3509f26ef041040e383"
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
