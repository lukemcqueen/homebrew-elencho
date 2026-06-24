# typed: false
# frozen_string_literal: true

class Elencho < Formula
  desc "Supply-chain malware and obfuscation scanner"
  homepage "https://github.com/lukemcqueen/elencho"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.1/elencho-darwin-arm64"
      sha256 "12c3145864125fe89a24daf1f2bbf6161c21a40d9f2d8e4a419d334bee07e7b7"
    else
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.1/elencho-darwin-amd64"
      sha256 "8ad5f4753de4f34419ae1f8cac6c1d2ec73a95c9b062e932a5de57cc1d52392d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.1/elencho-linux-arm64"
      sha256 "ea91139254f035ad7d487dc57a3f1be23b78beea742b3616ac624422a6f160d9"
    else
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.1/elencho-linux-amd64"
      sha256 "331f56556412e499d57eb9ce5864efee2a2001fdd37ac0c8b7dab68a9aa7292b"
    end
  end

  def install
    bin.install Dir["elencho-*"].first => "elencho"
  end

  test do
    assert_match "elencho #{version}", shell_output("#{bin}/elencho --version")
    assert_match "Available rules:", shell_output("#{bin}/elencho --list-rules")
  end
end
