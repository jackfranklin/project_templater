require_relative "../../generators/generator.rb"

class SinatraBasic < Generator
  def run
    make_file("app.rb")
    make_file("config.ru", "require './app'\nrun Sinatra::Application")
  end
end
