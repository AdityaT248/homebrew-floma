# Homebrew Formula for floma
# To use this formula:
# 1. brew tap AdityaT248/floma
# 2. brew install floma

class Floma < Formula
  desc "AI-Powered Workflow Automation Tool - No Code Required"
  homepage "https://getfloma.com"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-arm64"
      sha256 "22b3ef6418737883192b17162a2c89d454b906c284acfa403f071974f7e8fc22"
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-macos-x86_64"
      sha256 "PLACEHOLDER_MACOS_INTEL_SHA256"  # Will be updated after build
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64_SHA256"  # Will be updated after build
    else
      url "https://pub-3da12ce477ba4b969191f6514d7505ff.r2.dev/floma-linux-x86_64"
      sha256 "PLACEHOLDER_LINUX_X86_64_SHA256"  # Will be updated after build
    end
  end

  def install
    # Determine the binary name based on platform
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "floma-macos-arm64" : "floma-macos-x86_64"
    else
      binary_name = Hardware::CPU.arm? ? "floma-linux-arm64" : "floma-linux-x86_64"
    end

    bin.install binary_name => "floma"
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
