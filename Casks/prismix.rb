# Cask for the tap rsx-xxx/homebrew-prismix (Casks/prismix.rb).
# Per release: set `version` and `sha256` (shasum -a 256 Prismix.dmg).
cask "prismix" do
  version "0.0.47"
  sha256 "2265a1faaff713ce4f5c9f57210097ed2e0f5ac48eee935418295ee014e9b19f"

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
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Prismix.app"]
  end

  zap trash: "~/Library/Application Support/Prismix"
end
