class String
  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map{|e| e.capitalize}.join
  end
end


require "generators/generator.rb"

class ProjectTemplater
  def initialize(template)
    @template = template
    puts "That generator doesn't exist." unless generator_exists?
  end

  def valid?
    generator_exists?
  end

  def self.generators
    Dir["lib/generators/*.rb"]
      .map { |g| g.split("/").last }
      .map { |g| g.gsub(".rb", "") }
      .select { |g| g != "generator" }
  end

  def run(base_dir)
    base_dir = Dir.pwd + "/" + (base_dir ||= "")
    class_name = @template.camel_case
    instance = Object::const_get(class_name).new(base_dir)
    instance.pre_install
    instance.run
    instance.post_install
  end

  private

  def generator_exists?
    begin
      require "generators/#{@template}.rb"
      true
    rescue Exception
      false
    end
  end
end

