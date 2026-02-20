# RailsPartialKit

A lightweight helper system for building reusable Rails UI components with partials. Provides a clean, modular approach to creating and rendering UI components across your Rails application.

## Features

- **Simple Registry API** - Register components with a clean, declarative syntax
- **Partial-based** - Leverage Rails' existing partial rendering system
- **Default Values** - Set sensible defaults for component props
- **Validation** - Validate required props before rendering
- **Auto-loading** - Automatically load component definitions from `app/components`
- **Generators** - Quickly scaffold new components with built-in generators

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_partial_kit"
```

And then execute:
```bash
$ bundle
```

Run the install generator:

```bash
$ rails generate rails_partial_kit:install
```

This creates `config/initializers/rails_partial_kit.rb` which sets up component auto-loading.

## Quick Start

### Generate a Component

Use the built-in generator to create a new component:

```bash
# Basic component
rails generate rails_partial_kit:component card title

# Component with variant option
rails generate rails_partial_kit:component button text variant:primary

# Component with custom partial path
rails generate rails_partial_kit:component panel body partial:admin/panels

# Skip partial creation (register only)
rails generate rails_partial_kit:component modal title --no_partial
```

This creates:
- `app/components/{name}_component.rb` - Component registration file
- `app/views/shared/components/{name}/_{name}.html.erb` - Partial template

### Use in Views

```erb
<%= component :card, title: "Hello", body: "World" %>

<%= component :button, text: "Click me", variant: :primary %>

<%= component :alert, message: "Something happened!", variant: :warning %>
```

## Generators

### Install Generator

Sets up the initializer for component auto-loading:

```bash
rails generate rails_partial_kit:install
```

### Component Generator

Creates a new component with registration and partial:

```bash
rails generate rails_partial_kit:component NAME [fields] [options]
```

**Options:**

| Option | Description |
|--------|-------------|
| `partial` | Custom partial path (default: `shared/components/NAME`) |
| `variant` | Add a variant default value |
| `no_partial` | Skip creating the partial file |

**Examples:**

```bash
# Create a card component with required title field
rails g rails_partial_kit:component card title

# Create a button with variant default
rails g rails_partial_kit:component button text variant:primary

# Create a panel with custom partial location
rails g rails_partial_kit:component panel title partial:admin/panels

# Create a modal without partial (you'll create it manually)
rails g rails_partial_kit:component modal title --no_partial
```

## API Reference

### ComponentRegistry.register

Register a new component.

```ruby
RailsPartialKit::ComponentRegistry.register(:button, {
  partial: 'shared/components/button',  # Path to the partial
  defaults: { variant: :primary },       # Default values for props
  validator: { required: [:text] }       # Required props
})
```

**Options:**

| Option | Type | Description |
|--------|------|-------------|
| `partial` | String | Path to the partial file (required) |
| `defaults` | Hash | Default values for locals |
| `validator` | Hash/Proc | Validation rules or callable |

### component Helper

Render a component in your views.

```erb
<%= component :button, text: "Click me", variant: :primary %>
```

### Validator Types

**Hash Validator:**
```ruby
validator: { required: [:title, :body] }
```

**Proc Validator:**
```ruby
validator: ->(locals) { raise "Invalid!" unless locals[:title].length > 5 }
```

## Example Components

### Button Component

```ruby
# app/components/button_component.rb
RailsPartialKit::ComponentRegistry.register(:button, {
  partial: 'shared/components/button',
  defaults: { variant: :primary, size: :md },
  validator: { required: [:text] }
})
```

```erb
<%# app/views/shared/components/_button.html.erb %>
<%
  variant = local_assigns[:variant] || :primary
  size = local_assigns[:size] || :md
  classes = "btn btn--#{variant} btn--#{size}"
%>
<%= tag.button(local_assigns[:text], class: classes) %>
```

### Alert Component

```ruby
# app/components/alert_component.rb
RailsPartialKit::ComponentRegistry.register(:alert, {
  partial: 'shared/components/alert',
  defaults: { variant: :info, dismissible: false },
  validator: { required: [:message] }
})
```

```erb
<%# app/views/shared/components/_alert.html.erb %>
<div class="alert alert--<%= local_assigns[:variant] %>">
  <%= local_assigns[:message] %>
</div>
```

## Development

Run the demo application:

```bash
npm run dev
```

Visit `http://localhost:3000/components_demo` to see example components.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
