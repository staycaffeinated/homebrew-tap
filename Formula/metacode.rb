# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Metacode < Formula
  desc "A code generator for Spring-based applications"
  homepage "https://github.com/staycaffeinated/metacode/"
  url "https://raw.githubusercontent.com/staycaffeinated/homebrew-tap/main/metacode-11.0.1.tar.gz"
  sha256 "ed653012f1fa5c2154e2d958bfe0b3a285db51275f7c4d3ace4003dc9afc4638"
  license "Apache 2.0"
  
  # metacode requires jdk17, but don't force installing jdk17
  # depends_on "openjdk@17"

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
    assert_match "11.0.1", output
  end
end
