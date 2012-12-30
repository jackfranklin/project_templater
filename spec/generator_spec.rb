require_relative "../lib/generators/generator.rb"
require "shell/executer.rb"
describe Generator do
  after(:all) do
    FileUtils.rm_r("spec/TEST/")
    FileUtils.mkdir("spec/TEST")
  end

  let(:g) { Generator.new("spec/TEST") }
  describe "#make_file" do
    it "makes the file" do
      g.make_file("test.txt")
      expect(Shell.execute("cat spec/TEST/test.txt").success?).to eq(true)
    end

    it "uses the block to set file contents" do
      g.make_file("test.txt") {
        "hello"
      }
      expect(IO.read("spec/TEST/test.txt")).to eq("hello")
    end
  end

  describe "#make_dir" do
    it "makes the directory" do
      g.make_dir("test")
      expect(Shell.execute("ls spec/TEST/test").success?).to eq(true)
    end
  end
end

