# calabi.rb — Homebrew formula for the calabi client.
#
# Lives in a tap repo: github.com/<org>/homebrew-tap at Formula/calabi.rb, so
#   brew tap calabi/tap        # = github.com/calabi/homebrew-tap
#   brew install calabi
#
# `brew tap calabi/tap` ALWAYS resolves to a GitHub repo named homebrew-tap —
# it does NOT read download.calabi.net. Only the tarballs below live there
# (under /latest/, the rolling current-release path).
#
# On each release: bump `version` and replace all four sha256 values (they're in
# packaging/checksums.txt).
class Calabi < Formula
  desc "Secure tunnels to localhost — HTTPS/TCP/UDP with access control"
  homepage "https://calabi.net"
  version "0.1.0"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "1e1ad3389875028b3f47214d250844d03d8d53a0062d03db993fc6b5767e39ba"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "5a9ea9c6cb39faaa716efa5661bfda0d61bbb0026158bf765785a8cfddb6151d"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "97cba39f6b468e93031f3cf1494e37a3a2c8d4d17c56c0ad1e0a11b4ab7dda95"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "41d98f620594978b8950cd80c30e01dddb16c6e0a45e82bd7157c027d1ec24eb"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
