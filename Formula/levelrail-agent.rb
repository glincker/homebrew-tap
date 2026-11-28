class LevelrailAgent < Formula
  desc "Node agent for Levelrail, a self-hosted deployment platform"
  homepage "https://levelrail.com"
  version "1.5.14"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.14/levelrail-agent-darwin-arm64"
      sha256 "f2c6a4fa680c5b3bb54d808d0bd4ce2ea447401e6457e94b5c1d4fd93a25f3b3"
    end
    on_intel do
      url "https://github.com/glincker/levelrail/releases/download/v1.5.14/levelrail-agent-darwin-amd64"
      sha256 "12f0c6f0c90ff94a86cbda9f127ea6df1851a10fd10f73343288b0772946356b"
    end
  end

  def install
    bin.install Dir["levelrail-agent-*"].first => "levelrail-agent"
    chmod 0555, bin/"levelrail-agent"

    # brew services cannot read an env file, so a wrapper loads it and sets a user-writable state path.
    (bin/"levelrail-agent-service").write <<~SH
      #!/bin/sh
      set -eu
      env_file="#{etc}/levelrail-agent.env"
      if [ -f "$env_file" ]; then
        set -a
        . "$env_file"
        set +a
      fi
      mkdir -p "#{var}/levelrail-agent"
      : "${APP_AGENT_IDENTITY_FILE:=#{var}/levelrail-agent/identity.json}"
      export APP_AGENT_IDENTITY_FILE
      exec "#{opt_bin}/levelrail-agent"
    SH
    chmod 0555, bin/"levelrail-agent-service"
  end

  service do
    run [opt_bin/"levelrail-agent-service"]
    keep_alive true
    working_dir var/"levelrail-agent"
    environment_variables PATH: std_service_path_env
    log_path var/"log/levelrail-agent.log"
    error_log_path var/"log/levelrail-agent.log"
  end

  def caveats
    <<~EOS
      The agent needs a container runtime (Docker Desktop, OrbStack or Lima) and
      is not notarized by Apple. Enrol it once in the foreground, with the values
      from the node's join command in the Levelrail dashboard:

        APP_CONTROL_PLANE_ADDR=<host:port> APP_JOIN_TOKEN=<token> \\
        APP_CA_FINGERPRINT=<fingerprint> \\
        APP_AGENT_IDENTITY_FILE=#{var}/levelrail-agent/identity.json \\
        levelrail-agent

      Stop it with Ctrl-C once the node shows as connected, then put the
      long-lived settings in #{etc}/levelrail-agent.env (one KEY=value per line):

        APP_CONTROL_PLANE_ADDR=<host:port>
        APP_CA_FINGERPRINT=<fingerprint>

      Do not keep the join token in that file. Then start it at login with:

        brew services start levelrail-agent

      State is stored in #{var}/levelrail-agent and logs in #{var}/log/levelrail-agent.log.
    EOS
  end

  test do
    assert_predicate bin/"levelrail-agent", :executable?
    assert_match version.to_s, shell_output("#{bin}/levelrail-agent --version")
    assert_match "APP_CONTROL_PLANE_ADDR", shell_output("#{bin}/levelrail-agent --help")
  end
end
