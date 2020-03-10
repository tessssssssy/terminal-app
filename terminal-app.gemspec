require_relative 'lib/terminal/app/version'

Gem::Specification.new do |spec|
  spec.name          = "terminal-app"
  spec.version       = Terminal::App::VERSION
  spec.authors       = ["tessssssssy"]
  spec.email         = ["tessfabry@gmail.com"]

  spec.summary       = "An activity log app" # summary of the app
  #spec.description   = %q{TODO: Write a longer description or delete this line.} # description of the app
  spec.homepage      = "https://github.com/tessssssssy/terminal-app" # url of the gem (or github repo)
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/tessssssssy/terminal-app"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  #spec.add_dependency '' # add gems to include
end
