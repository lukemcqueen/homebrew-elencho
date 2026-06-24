# typed: false
# frozen_string_literal: true

class Elencho < Formula
  desc "Supply-chain malware and obfuscation scanner"
  homepage "https://github.com/lukemcqueen/elencho"
  license "MIT"
  version "0.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.2/elencho-darwin-arm64"
      sha256 "0b64fba1cdb169a82842753d91db14dea71a7fab36c83e0c7a65f4897d2735e6"
    else
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.2/elencho-darwin-amd64"
      sha256 "579156f083fe35ebe616fdd55f81a42a44279903c4edf4fd142b52a668619634"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.2/elencho-linux-arm64"
      sha256 "a65d3b8503667debf4366148dd39ab382af4edb53675af9ba6b55bfed08a2295"
    else
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.2/elencho-linux-amd64"
      sha256 "7f465c1bdad9eff2edc1d647738e8d990cf5f9a161aa41e50b2fd82f8c462040"
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
