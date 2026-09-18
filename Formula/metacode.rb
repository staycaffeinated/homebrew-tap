# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Metacode < Formula
  desc "A code generator for Spring-based applications"
  homepage "https://github.com/staycaffeinated/metacode/"
  url "https://github.com/staycaffeinated/metacode/releases/download/v14.3.0/metacode-14.3.0.tar.gz"
  sha256 "6ab03729e9ad6af4bb1790cda254a561f674738e30be4d48cc89e0628570be5a"
  license "Apache 2.0"
  
  # metacode requires jdk21, but don't force installing it
  # depends_on "openjdk@21"

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
    assert_match "14.3.0", output
  end
end
