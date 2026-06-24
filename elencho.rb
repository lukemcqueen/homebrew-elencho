# typed: false
# frozen_string_literal: true

class Elencho < Formula
  desc "Supply-chain malware and obfuscation scanner"
  homepage "https://github.com/lukemcqueen/elencho"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.0/elencho-darwin-arm64"
      sha256 "96baa2ee0ddc6d63d96f1f024fdb9ba957f38d8c6e958f367e81af980b4657f1"
    else
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.0/elencho-darwin-amd64"
      sha256 "e3048ef2752de8e3be11b727c638b5be41dfd73e90e4b3ca65ab3160a76c33d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.0/elencho-linux-arm64"
      sha256 "b510d281271d597d05cdb0d96425628ca6a973a8679ed57441a3a0e9b9033a6e"
    else
      url "https://github.com/lukemcqueen/elencho/releases/download/v0.3.0/elencho-linux-amd64"
      sha256 "204faeb406c2fb3301aed520fa456a3f03ff29fcabd01708039ed433af1570f6"
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
