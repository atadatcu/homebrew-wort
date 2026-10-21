cask "wort" do
  version "70"
  sha256 "d3fce81896c32e9ae3f66d8ac479bb9e728d62757d8bac108b896cee3fb58633"

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
