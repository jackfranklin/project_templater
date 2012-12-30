# Project Templater

__NOTE__
This is currently a WIP and is not yet released.

## Installation

```
gem install project_templater
```

Adds `project_templater` executable.

## Usage

```
project_templater {generator} {path}
```

Templates are listed within `lib/generators`.

Will default to the PWD if you don't define a path.

## Examples

```
project_templater sinatra_basic
```

Run the `sinatra_basic` generator and output to the current directory

```
project_templater sinatra_basic foo/
```

Run the `sinatra_basic` generator and output to the `pwd/foo/ directory`.

## Available Generators
- `sinatra_basic`


## Adding a Generator

These exist within `lib/generators`. Create a new `.rb` file. The class must extend from `Generator`, and you need to define an instance method `run`.

You have two methods available to you, `make_file` and `make_dir`.

The best way to do it is to copy an existing one. For example, here's `lib/generators/sinatra_basic.rb`:

```
require_relative "./generator.rb"

class SinatraBasic < Generator
  def run
    make_file("Gemfile") {
      "source 'http://rubygems.org'\ngem 'sinatra'"
    }
    make_file("app.rb") {
      "require 'sinatra'"
    }
    make_file("config.ru") {
      "require './app'\nrun Sinatra::Application"
    }
    make_dir("public")
    make_dir("public/css")
    make_dir("public/js")
    make_file("public/css/style.css")
    make_file("public/js/app.js")
  end
end
```

`make_file` can be called with just the file to create, and optionally a block. Whatever is returned from the block is then stored as the contents of the file.



