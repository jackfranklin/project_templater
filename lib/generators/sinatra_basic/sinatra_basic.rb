require_relative "../../generators/generator.rb"

class SinatraBasic < Generator
  def run
    make_file("Gemfile") {
      "source 'http://rubygems.org'\ngem 'sinatra'"
    }
    make_file("app.rb") {
      "require 'sinatra'"
    }
    make_file("config.ru") {
      "require './app'\nrun Sinatra::Application"
    }
    make_dir("public")
    make_dir("public/css")
    make_dir("public/js")
    make_file("public/css/style.css")
    make_file("public/js/app.js")
  end
end
