# Project Templater

__V0.3.1__

## Installation

```
gem install project_templater
```

Adds the `project_templater` executable.

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
- `js_project`
- `ruby_project`
- `html_proto`
- `jekyll_basic`

## Adding a Generator

These exist within `lib/generators`. Create a new `.rb` file. The class must extend from `Generator`, and you need to define an instance method `run`.

You have two methods available to you, `make_file` and `make_dir`.

The best way to do it is to copy an existing one - they are all in `lib/generators`.

Define a `run` method that will be called. There are two methods available:

- `make_file` can be called with just the file to create, and optionally a block. Whatever is returned from the block is then stored as the contents of the file.
- `make_dir` will create a new directory.

You can also define a `post_install` method that is run after the `run` method has. You also have access to the `@base` variable, which is the directory the generator was run in.

Similarly, there is a `pre_install` method which is run just before `run`. Again, it has access to `@base`.

## Changelog

__0.3.1__
- No nasty exception if the generator doesn't exist.

__0.3.0__
- Remove all references to `nodefetch`
- Fix Sinatra generator. Makes views directory in right place and now sets up layout.erb properly.

__0.2.1__
- release date within gemspec was incorrect.

__0.2.0__
- added `jekyll_basic` generator
- add `pre_install` method for generators

__0.1.2__
- added `html_proto` generator, designed for quick HTML prototypes

__0.1.1__
- updated `ruby_basic` generator so it creates a couple more folders

__0.1.0__
- initial release



