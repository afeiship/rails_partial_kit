# Register the alert component
RailsPartialKit::ComponentRegistry.register(:alert, {
  partial: 'shared/components/alert',
  defaults: { variant: :info, dismissible: false },
  validator: { required: [:message] }
})
