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
  version "1.11.1"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "0cbf761acb80d9112cfb8a766e9ba1b6276c5e830b7eebb64cdade6bb5eee29c"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "b0049cbed8b7bf7983f450337ecbcd64683655409c61b6200bf5644a94df76fc"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "ca1bd09548816b01eebae7eb1e79008fed71187c393c5c2c14c3967bfddf7df5"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "f84d96b27191ba8bdc1e05bb4019a40df7f61a8d101ac8de701a20652070fa41"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
