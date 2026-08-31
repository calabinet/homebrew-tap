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
  version "1.4.1"
  # Set this to the client's real distribution license before publishing.
  # license "Proprietary"

  on_macos do
    on_arm do
      url "https://download.calabi.net/latest/calabi-macos-arm64.tar.gz"
      sha256 "2909742661f248edc89559bcc6c8190fa033c0a65b7c6cdcfb87768f75b7bf92"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-macos-amd64.tar.gz"
      sha256 "c7ce8127f46d4d8e0e1a478e3c677ebef4fc907a736e43bf81b22cdcbd532955"
    end
  end

  on_linux do
    on_arm do
      url "https://download.calabi.net/latest/calabi-linux-arm64.tar.gz"
      sha256 "5357aae97803f4afdb92b5a79d1677d4abec8f5d2190b2e3a53e9012df0ab2c5"
    end
    on_intel do
      url "https://download.calabi.net/latest/calabi-linux-amd64.tar.gz"
      sha256 "cbc2a14af3a2fb372e4d35b44165ddf5f9ae4233e8e688a4297c0a1a927447a4"
    end
  end

  def install
    bin.install "calabi"
  end

  test do
    assert_match "calabi", shell_output("#{bin}/calabi version")
  end
end
