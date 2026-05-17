cask "bsh-sdiagent" do
  version "1.0.1"
  sha256 "76d0879c22f55bf0eefa5f865d28872e0f83831ca578a54f0c10868db4f7b536"

  url "https://github.com/Digital-Defiance/bsh-sdi-agent/releases/download/v1.0.1/BSH-SDIAgent-1.0.1.zip"
  name "BSH SDIAgent"
  desc "Secure Data Injection Agent for BrightShell"
  homepage "https://github.com/Digital-Defiance/bsh-sdi-agent"

  app "BSH SDIAgent.app"

  caveats do
    """
    After installation, you may need to grant accessibility permissions in System Preferences > Security & Privacy > Privacy > Accessibility for full functionality.
    """
  end
end
