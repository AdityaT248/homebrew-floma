# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-arm64"
      sha256 "f714a178194ba1da0a4f2864e2f4563413a75365adb42e8c6a824da637978f3b"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-x86_64"
      sha256 "2ffab1d0719929b4ea13caa161a3f2bd69d95777ca0a40a2eaa16c45ac9dc0bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-arm64"
      sha256 "fb6e8997670e2b5b21e0813bf9878a3c5fb95cc0f1d22b1d3bffc5e8bd3d4005"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-x86_64"
      sha256 "41d87e12aa989c177ec2b7ba6ae1430c26714624458cb571a4f068106f0426b1"
    end
  end

  # Pre-built binary - no compilation needed
  def install
    # Determine the binary name based on platform
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "floma-macos-arm64" : "floma-macos-x86_64"
    else
      binary_name = Hardware::CPU.arm? ? "floma-linux-arm64" : "floma-linux-x86_64"
    end

    bin.install binary_name => "floma"
  end

  def pour_bottle?
    false
  end

  test do
    system "#{bin}/floma", "--help"
  end

  def caveats
    <<~EOS
      🎉 Floma has been installed!

      Quick Start:
        floma new "Extract totals from PDFs in ~/receipts and save to Excel"
        floma list
        floma run <workflow_id>

      Documentation: https://getfloma.com/docs

      Note: Free tier includes 5 AI extractions/month
            Upgrade at https://getfloma.com for more features
    EOS
  end
end
