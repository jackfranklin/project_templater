require "fileutils"

class Generator
  def initialize(base_dir)
    @base = base_dir
    unless @base[-1, 1] == "/"
      @base = @base + "/"
    end
  end

  def pre_install
  end

  def post_install
  end

  def make_file(path, &block)
    contents = ""
    contents = block.call if block_given?
    puts "Writing file: #{@base + path}"
    File.open(@base + path, 'w') {|f| f.write(contents) }
  end

  def make_dir(path)
    puts "Writing folder: #{@base + path}"
    FileUtils.mkdir_p(@base + path)
  end
end
