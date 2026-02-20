# Register the button component
RailsPartialKit::ComponentRegistry.register(:button, {
  partial: 'shared/components/button',
  defaults: { variant: :primary, size: :md },
  validator: { required: [:text] }
})
