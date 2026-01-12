class RemoteVibecode < Formula
  desc "Tmux Terminal Sharing Service - View and interact with tmux sessions in real-time"
  homepage "https://github.com/ibrahim/remote-vibecode"
  url "https://github.com/ibrahim/remote-vibecode/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "SHA256_PLACEHOLDER"
  license "MIT"

  depends_on "go" => :build
  depends_on "tmux" => :runtime

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./service/cmd/server"
    (var/"log").mkdir
  end

  service do
    run [opt_bin/"server"]
    keep_alive true
    log_path var/"log/server.log"
    error_log_path var/"log/server.error.log"
    environment_variables PATH: std_service_path_env
    working_dir Dir.home
  end

  test do
    port = free_port
    ENV["PORT"] = port.to_s
    fork do
      exec bin/"server"
    end
    sleep 2
    assert_match "OK", shell_output("curl -s http://localhost:#{port}/api/v1/health")
  end
end
