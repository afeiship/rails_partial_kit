require_relative "lib/rails_partial_kit/version"

Gem::Specification.new do |spec|
  spec.name        = "rails_partial_kit"
  spec.version     = RailsPartialKit::VERSION
  spec.authors     = ["aric.zheng"]
  spec.email       = ["1290657123@qq.com"]
  spec.homepage    = "https://github.com/afeiship/rails_partial_kit"
  spec.summary     = "A lightweight helper system for building reusable Rails UI components with partials."
  spec.description = "A lightweight helper system for building reusable Rails UI components with partials. Provides a clean, modular approach to creating and rendering UI components across your Rails application."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/afeiship/rails_partial_kit/blob/main/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://github.com/afeiship/rails_partial_kit/blob/main/README.md"
  spec.metadata["ai_assistant_uri"] = "https://github.com/afeiship/rails_partial_kit/blob/main/llms.txt"

  spec.required_ruby_version = ">= 3.0.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "llms.txt"]
  end

  spec.add_dependency "rails", ">= 6.0", "< 9.0"
end
