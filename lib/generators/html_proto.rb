require_relative "./generator.rb"

class HtmlProto < Generator
  def run
    make_file("index.html") {
%Q|<!DOCTYPE html>
<html>
<head>
  <title>JS Regex</title>
  <link rel="stylesheet" href="css/style.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/app.js"></script>
</head>
<body>
</body>
</html>|
    }


    make_dir("js")
    make_dir("css")

    make_file("js/app.js")
    make_file("css/style.css")
  end

  def post_install
    `cd #{@base}js && nodefetch jquery`
  end

end
