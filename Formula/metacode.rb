# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Metacode < Formula
  desc "A code generator for Spring-based REST services"
  homepage "https://github.com/staycaffeinated/metacode/"
  url "https://raw.githubusercontent.com/staycaffeinated/homebrew-tap/main/metacode-0.1.2.tar.gz"
  sha256 "21f5a9ec5ccc92e6cc9ea016f013462f9ee8d306b7b01eb46f0518d6ca4fae81"
  license "Apache 2.0"

  def install
    # put the extracted tgz into the "private" libexec folder
    # homebrew automatically unarchives the tar.gz file for us,
    libexec.install Dir["*"] 
    # The distribution jar created by Shadown contains a lib and bin folder.
    # The lib folder contains all the jars needed to run the app
    # The bin folder contains a 'metacode' shell script and metacode.bat file
    # Here, a symbolic link to said bin/metcode shell script created
    bin.install_symlink "#{libexec}/bin/metacode"
  end

  test do
    # `test do` will create, run in, and delete a temporary directory.
    #
    # You can manually run the test with the command: `brew test metacode`. 
    #
    output = shell_output("#{bin}/metacode --version")
    assert_match "0.1.2", output
  end
end
