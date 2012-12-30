desc "Install Gemfile"
task :install_gem do
  sh %{ gem build project_templater.gemspec }
  sh %{ gem install project_templater-0.0.3.gem }
end
