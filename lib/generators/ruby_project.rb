require_relative "./generator.rb"

class RubyProject < Generator
  def run
    make_file("Gemfile") {
      "source 'http://rubygems.org'\ngem 'rspec'"
    }
    make_file(".rspec") {
      "--color"
    }
    make_file(".gitignore")
    make_dir("lib")
    make_dir("spec")
    make_dir("spec/unit")
    make_dir("spec/integration")
  end

  def post_install
    puts `cd #{@base} && git init && bundle`
  end
end
