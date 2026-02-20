# Register the card component
RailsPartialKit::ComponentRegistry.register(:card, {
  partial: 'shared/components/card',
  defaults: { variant: :default },
  validator: { required: [:title] }
})
