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
  version "1.9.0"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "23d77e97cad6a81c4e72126fe3c206f6e4a174ceec5a006c631a2c4d4d2f5e3c"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "6c5710a71cf555d96c560a0750bacdc9fa24857e9f0bc353c848563d0c292176"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "4dd849c94763a183cde215b5bf413b55d7347c7a531e31bd63856584285771da"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "018ffa5685b4c8d98dfd1a42572300782385fecce4b5c5c0c4023a1906db5be6"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
