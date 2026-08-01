cask "workpot" do
  version "0.0.6"
  sha256 "56408d4b95f2c93510008698fc961bb1f82bb84899d288ca5b6f97fb8b27b729"

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
