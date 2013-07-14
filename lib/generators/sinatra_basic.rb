require_relative "./generator.rb"

class SinatraBasic < Generator
  def run
    make_file("Gemfile") {
      "source 'http://rubygems.org'\ngem 'sinatra'"
    }
    make_file("app.rb") {
%Q|
require 'sinatra'

get '/' do
  erb :index
end
|
    }

    make_file("config.ru") {
      "require './app'\nrun Sinatra::Application"
    }
    make_file("README.md")

    make_dir("public")
    make_dir("public/css")
    make_dir("public/js")
    make_dir("views")
    make_file("views/layout.erb") {
%Q|<!DOCTYPE html>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
  <%= yield %>
</body>
</html> |
    }
    make_file("views/index.erb") { "Hello World" }
    make_file("public/css/style.css")
  end

  def post_install
    puts `cd #{@base} && git init && bundle`
  end
end
