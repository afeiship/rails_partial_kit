# Load component definitions from app/components
components_path = Rails.root.join("app", "components", "**", "*.rb")
Dir.glob(components_path).each { |file| load file }
