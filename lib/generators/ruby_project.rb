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
    make_dir("spec")
  end

  def post_install
    `cd #{@base} && git init && bundle`
  end
end
