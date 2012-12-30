class String
  def camel_case
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split('_').map{|e| e.capitalize}.join
  end
end


require "generators/generator.rb"
require "generators/sinatra_basic/sinatra_basic.rb"

class ProjectTemplater
  def initialize(template)
    @template = template
  end

  def run
    class_name = @template.camel_case
    instance = Object::const_get(class_name).new.run
  end
end

