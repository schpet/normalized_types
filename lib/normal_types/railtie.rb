module NormalTypes
  class Railtie < Rails::Railtie
    initializer "normal_types.configure_rails_initialization" do
      ActiveRecord::Type.register(:normal_string, NormalTypes::String)
    end
  end
end
