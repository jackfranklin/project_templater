require "project_templater"
require "shell/executer.rb"
require "fileutils"

describe ProjectTemplater do
  after(:all) do
    FileUtils.rm_r("spec/TEST")
    FileUtils.mkdir("spec/TEST")
  end
  describe "sinatra_basic" do
    let(:instance) { ProjectTemplater.new("sinatra_basic") }
    before(:all) do
      puts "running"
      instance.run("spec/TEST/")
    end

    it "creates an app.rb file" do
      expect(Shell.execute("cat spec/TEST/app.rb").success?).to eq(true)
    end

    it "creates a config.ru file" do
      res = Shell.execute("cat spec/TEST/config.ru").stdout.split("\n")
      expect(res.first).to eq("require './app'")
      expect(res.last).to eq("run Sinatra::Application")
    end
  end
end
