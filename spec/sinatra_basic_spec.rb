require "project_templater"
require "shell/executer.rb"
require "fileutils"

describe ProjectTemplater do
  after(:each) do
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
  end
end
