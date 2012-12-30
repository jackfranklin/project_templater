require "fileutils"

class Generator
  def initialize(base_dir)
    @base = base_dir
    unless @base[-1, 1] == "/"
      @base = @base + "/"
    end
  end

  def make_file(path, &block)
    contents = ""
    contents = block.call if block_given?
    File.open(@base + path, 'w') {|f| f.write(contents) }
  end

  def make_dir(path)
    FileUtils.mkdir_p(@base + path)
  end
end
