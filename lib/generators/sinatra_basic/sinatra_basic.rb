require_relative "../../generators/generator.rb"

class SinatraBasic < Generator
  def run
    make_file("app.rb")
  end
end
