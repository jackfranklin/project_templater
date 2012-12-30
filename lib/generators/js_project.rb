require_relative "./generator.rb"

class JSProject < Generator
  def run
    make_file("package.json")
    make_file("README.md")
    make_dir("test")
    make_dir("src")
    make_dir("demo")

  end

  def post_install
    `cd #{@base} && git init`
  end
end
