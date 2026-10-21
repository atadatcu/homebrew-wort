cask "wort" do
  version "72"
  sha256 "beaa93f107963bfa8c85f64b5c82538e8ece1efe5503809a3c284c3d2538a1ed"

  url "https://github.com/atadatcu/wort-builder/releases/download/v#{version}/Wort.dmg"
  name "Wort"
  desc "Local-first terminal (fork of Warp Lite / WarpOss)"
  homepage "https://gitlab.com/adatcu/wort"

  app "Wort.app"

  livecheck do
    url "https://github.com/atadatcu/wort-builder/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)*)}i)
  end

  caveats <<~EOS
    If macOS blocks the app (unsigned/unnotarized):
      xattr -cr /Applications/Wort.app
  EOS

  zap trash: [
    "~/Library/Application Support/dev.warp-lite.WarpLite",
  ]
end
