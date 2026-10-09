# calabi.rb — Homebrew formula for the calabi client.
#
# Lives in a tap repo: github.com/calabinet/homebrew-tap at Formula/calabi.rb, so
#   brew tap calabinet/tap        # = github.com/calabinet/homebrew-tap
#   brew install calabi
#
# `brew tap calabinet/tap` ALWAYS resolves to a GitHub repo named homebrew-tap —
# it does NOT read download.calabi.net. Only the tarballs below live there
# (under /latest/, the rolling current-release path).
#
# On each release: bump `version` and replace all four sha256 values (they're in
# packaging/SHA256SUMS).
class Calabi < Formula
  desc "Secure tunnels to localhost — HTTPS/TCP/UDP with access control"
  homepage "https://calabi.net"
  version "2.2.0"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "300068de90699ae816f5e5e97a10c580f02eeb5cd21adf8176fd33a423d371f2"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "433a691128fca238fd43d7f8a1f76c16dda48c11a8bbbeffe74d7e600f6ead5b"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "7da9a797f2ce11fb0ab53d407722b639757c180c387662777f5db69ed1917056"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "63270d968d4e2818f284b41628ee7752aa9e12d830f4b69c42fb73a1fc9c9b29"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
