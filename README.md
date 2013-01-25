# ProjectGen

I create a *lot* of research development projects throughout the day.  Depending upon the language, I 
will either use a GUI to setup my project, a CLI like Bundler or SnakeSkin, or sometimes just manually
create the project setup.  This takes time, and since I keep using up this time doing the same thing,
I decided some automation and consolidation could be of use.

ProjectGen is a project generator tool that makes establishing new libraries and projects easier. It
also has the option to delegate to existing tools like Bundler to not reinvent the wheel, but keep a
consistent interface when not using these tools.

When not using third-party tools, ProjectGen does the following:

1. Creates the project directory
2. Calls `git init`
3. Processes any additional options passed (RVM setup, for example)

## Installation

ProjectGen is released as a Ruby gem.  `gem install project_gen`

## Usage

`project_gen PROJECT_NAME [CODE_SUBDIRECTORY] [OPTIONS]`

By default, ProjectGen uses a $PROJECTS ENV variable to determine where you hold your code.  See the
'--directory' option for how to override.  `CODE_SUBDIRECTORY` refers to a subdirectory inside your
$PROJECTS directory to place your project.  In my case, I have a `research` directory specifically for
prototyping and testing random ideas.  To create a new project, I would use the following:

`project_gen awesomeness research`

**OPTIONS**

* --type TYPE - Specifies a type of project to trigger automated tools like Bundler to setup instead
of ProjectGen's basic implementation.
* --rvm VERSION - Adds a .rvmrc file of the specified `VERSION@PROJECT_NAME` to the directory
* --directory DIR - Overrides the use of the $PROJECTS ENV variable when creating the project

## TODO

1. Add Ngen support
2. Add rbenv support

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
