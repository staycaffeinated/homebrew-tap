# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Metacode < Formula
  desc "A code generator for Spring-based applications"
  homepage "https://github.com/staycaffeinated/metacode/"
  url "https://raw.githubusercontent.com/staycaffeinated/homebrew-tap/main/metacode-5.3.0.tar.gz"
  sha256 "d5123776660c80d1ba7a4f0b0dcedf940f46891765691928492bc21b9d0bc96f"
  license "Apache 2.0"
  
  # metacode works with jdk11 or higher, but does not require java11
  # depends_on "openjdk@11"

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
    assert_match "5.3.0", output
  end
end
