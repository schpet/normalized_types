module NormalizedTypes
  class Railtie < Rails::Railtie
    initializer "normalized_types.configure_rails_initialization" do
      ActiveRecord::Type.register(:normalized_string, NormalizedTypes::String)
    end
  end
end
