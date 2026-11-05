# Cask for the tap rsx-xxx/homebrew-prismix (Casks/prismix.rb).
# Per release: set `version` and `sha256` (shasum -a 256 Prismix.dmg).
cask "prismix" do
  version "0.62.4"
  sha256 "6fd8b9a5259f65dc734351f654383270a079e5d39d7a8f992d618447f16cfd08"

  url "https://github.com/rsx-xxx/prismix/releases/download/v#{version}/Prismix.dmg"
  name "Prismix"
  desc "Split songs into stems, with chords, lyrics and tabs"
  homepage "https://github.com/rsx-xxx/prismix"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true # the app updates itself; `brew upgrade --greedy` still works

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Prismix.app"

  # The DMG is ad-hoc signed, not notarized (see packaging/SIGNING.md).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Prismix.app"]
  end

  zap trash: "~/Library/Application Support/Prismix"
end
