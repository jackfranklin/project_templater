require_relative "./generator.rb"

class JekyllBasic < Generator
  def run
    make_dir("_posts")
    make_dir("_layouts")
    make_dir("css")
    make_dir("js")
    make_dir("img")

    make_file("index.html")
    make_file("_layouts/default.html")
    make_file("css/style.css")
  end
end
