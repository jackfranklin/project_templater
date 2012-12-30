require "fileutils"

class Generator
  def initialize(base_dir)
    @base = base_dir
  end

  def make_file(path, contents = "")
    File.open(@base + path, 'w') {|f| f.write(contents) }
  end

  def make_dir(path)
    FileUtils.mkdir_p(@base + path)
  end
end
