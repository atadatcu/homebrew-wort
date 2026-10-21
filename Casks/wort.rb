cask "wort" do
  version "74"
  sha256 "94c738d9a8203da5b93c9ebc4e803c2a9286673cac65b90f88b95071fa010020"

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
