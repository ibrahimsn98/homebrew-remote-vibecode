class Rvc < Formula
  desc "Tmux Terminal Sharing Service - View and interact with tmux sessions in real-time"
  homepage "https://github.com/ibrahimsn98/remote-vibecode"
  url "https://github.com/ibrahimsn98/remote-vibecode/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e488fbf8537c76b4e6db2241955f8db8184fc558b309fccd5d29e8afbbe6e632"
  license "MIT"

  depends_on "go" => :build
  depends_on "tmux" => :runtime

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"rvc"), "./service/cmd/vibecode"
  end

  test do
    port = free_port
    fork do
      exec bin/"rvc", "serve", "--port", port.to_s
    end
    sleep 2
    assert_match "OK", shell_output("curl -s http://localhost:#{port}/api/v1/health")
  end
end
