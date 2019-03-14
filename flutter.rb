class Flutter < Formula
  desc "The Flutter SDK"
  homepage "https://flutter.io"
  url "https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.2.1-stable.zip"
  version "1.2.1"
  sha256 "74ac8397ea29720f116980ea00cf60c34430be1f64489b407f7cf95553babbef"

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
    system "false"
  end
end
