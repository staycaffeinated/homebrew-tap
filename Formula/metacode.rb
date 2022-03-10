# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class MetaCode < Formula
  desc "A code generator for Spring-based REST services"
  homepage "https://github.com/staycaffeinated/metacode/"
  url "https://raw.githubusercontent.com/staycaffeinated/homebrew-tap/main/metacode-application-0.1.0.tar.gz"
  sha256 "14e54874af957cb71329349a7ac83fa80ac3c9011b5f852fe376282797910ac7"
  license "Apache 2.0"

  def install
    # put the extracted jar into the "private" libexec folder
    # homebrew automatically unarchives the tar.gz file for us,
    # leaving us with the uber jar that gets copied to the install directory
    libexec.install "metacode-0.1.0-all.jar"
    # create a shell script to launch the jar file in the "public" bin folder
    # The shell script will have the entry 'java -jar mojo-application-x.y.z-all.jar'
    bin.write_jar_script libexec/"metacode-0.1.0-all.jar", "metacode"
  end

  test do
    # `test do` will create, run in, and delete a temporary directory.
    #
    # Run the test with `brew test mojo`. 
    #
    system "#{bin}/metacode --version"
  end
end
