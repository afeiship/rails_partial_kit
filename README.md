# RailsPartialKit

A lightweight helper system for building reusable Rails UI components with partials. Provides a clean, modular approach to creating and rendering UI components across your Rails application.

## Features

- **Simple Registry API** - Register components with a clean, declarative syntax
- **Partial-based** - Leverage Rails' existing partial rendering system
- **Default Values** - Set sensible defaults for component props
- **Validation** - Validate required props before rendering
- **Auto-loading** - Automatically load component definitions from `app/components`

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_partial_kit"
```

And then execute:
```bash
$ bundle
```

## Quick Start

### 1. Create a Partial

Create a partial in `app/views/shared/components/`:

```erb
<%# app/views/shared/components/_card.html.erb %>
<div class="card card--<%= local_assigns[:variant] || 'default' %>">
  <% if local_assigns[:title] %>
    <div class="card__header">
      <h3 class="card__title"><%= title %></h3>
    </div>
  <% end %>

  <% if local_assigns[:body] %>
    <div class="card__body">
      <%= body %>
    </div>
  <% end %>
</div>
```

### 2. Register the Component

Create a registration file in `app/components/`:

```ruby
# app/components/card_component.rb
RailsPartialKit::ComponentRegistry.register(:card, {
  partial: 'shared/components/card',
  defaults: { variant: :default },
  validator: { required: [:title] }
})
```

### 3. Use in Views

```erb
<%= component :card, title: "Hello", body: "World" %>

<%= component :card,
    title: "Success",
    body: "Operation completed!",
    variant: :success %>
```

## API Reference

### ComponentRegistry.register

Register a new component.

```ruby
ComponentRegistry.register(:button, {
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
