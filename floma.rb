# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.11/floma-macos-arm64"
      sha256 "77c9be33c6826f35c11db579902162bcee680b4a8cadb6cc48b0a2c2fc4344c0"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.11/floma-macos-x86_64"
      sha256 "29b7d08731448d219b09a1294532c1dd5679313ec31ab8965cba014461be44e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.11/floma-linux-arm64"
      sha256 "3d43daad2eb10ea23e28db94121304f99e493450d35b40a439f59d678710ae76"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/0.3.11/floma-linux-x86_64"
      sha256 "6ae3c9920318d76682a98a8e84985c6bcbed06b6fbd9bdedfd2c2d587eef8ebd"
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
