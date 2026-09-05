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
  version "1.7.1"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "034cee10bee901b2d38f6cfcaec1d2cca0bc72a144cefe80d5e347cb52b6f1b5"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "41408497da3e3588effb49ebafcc2812ee88cd5822feae30c750144020aedf13"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "be762a1998bb96c4f620a4fd938e0796ad4b0f34370216a70010167746264f32"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "036dca9de44c27db7098b1b7417d3dca9864d69fddbde17a2046720e8bf77fcf"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
