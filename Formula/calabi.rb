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
# packaging/SHA256SUMS).
class Calabi < Formula
  desc "Secure tunnels to localhost — HTTPS/TCP/UDP with access control"
  homepage "https://calabi.net"
  version "0.1.0"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "ec38b90c8551854ca6e881b6ea9cc06bea1b4232452ec3ece8bd34337f6e96ec"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "fe2ca05904ee63e294aba5b2f2ab162cd0699559d5746ed1c3bc7879d5be98bf"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "968f1c52d6f33a5a217ee1d8e32f77f07193ba827266b0624cee8b86e3f84d0b"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "1bf6418a0e00b7eb2916a3e12b8563bd56d6879cebcb20d4180031a40a5ab264"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
