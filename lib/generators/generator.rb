require "fileutils"

class Generator
  def make_file(path, contents)
    File.open(path, 'w') {|f| f.write(contents) }
  end

  def make_dir(path)
    FileUtils.mkdir_p(path)
  end
end
