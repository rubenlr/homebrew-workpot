cask "workpot" do
  version "0.0.2"
  sha256 "dc8b2144313acc4c0e4007204246216c49b3a70e890c99144ba5351505f6d9d0"

  url "https://github.com/rubenlr/workpot/releases/download/v#{version}/Workpot-#{version}-aarch64.tar.gz"
  name "Workpot"
  desc "macOS git workspace finder — fast repo switching and Cursor launch"
  homepage "https://github.com/rubenlr/workpot"

  depends_on macos: :monterey

  app "Workpot.app"

  # Symlink the CLI binary onto PATH.
  # workpot-tray is the Tauri main executable (GUI); workpot is the CLI, injected by CI.
  binary "#{appdir}/Workpot.app/Contents/MacOS/workpot"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Workpot.app"]
  end

  zap trash: [
    "~/Library/Application Support/workpot",
    "~/.config/workpot",
  ]
end
