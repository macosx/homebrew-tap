class Flutter < Formula
  desc "Build beautiful native apps on iOS and Android from a single codebase"
  homepage "https://flutter.io"
  version "1.2.1"
  url "https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v#{version}-stable.zip"
  sha256 "74ac8397ea29720f116980ea00cf60c34430be1f64489b407f7cf95553babbef"

  bottle :unneeded

  def install
    system "./bin/flutter"
    allfiles = File.join(buildpath, "**", "{*,.*}")
    mv Dir.glob(allfiles), Dir.glob(prefix), :force => true
  end

  def post_install
    rm File.join(HOMEBREW_PREFIX, "bin", "flutter.bat")
    chmod_R "+rwx", File.join(prefix, "bin")
  end

  test do
    system 'true'
  end
end
