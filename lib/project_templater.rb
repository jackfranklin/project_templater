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
    # load in the right generator
    require "generators/#{@template}/#{@template}.rb"
  end

  def run
    class_name = @template.camel_case
    instance = Object::const_get(class_name).new.run
  end
end

