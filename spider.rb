class Spider < Formula
  desc "small dart library to generate Assets dart code from assets folder."
  homepage "https://github.com/BirjuVachhani/spider"
  url "https://github.com/BirjuVachhani/spider/archive/1.1.0.tar.gz"
  sha256 "3f11440c57bdd64636350cdefd1b255903908b1242f7f5a7e8e5e06645d0e125"
  license "Apache-2.0"
  
  bottle :unneeded
  
  depends_on "dart-lang/dart/dart" => :build
  
  def install
    system "pub", "get"
    system "dart2native", "bin/main.dart", "-o", "spider"
    bin.install "spider"
  end
  
  test do
    system "#{bin}/spider", "--version"
    system "touch", "pubspec.yaml"
    system "#{bin}/spider", "create"
    raise 'test failed' unless File.exists? 'spider.yaml'
  end
end
