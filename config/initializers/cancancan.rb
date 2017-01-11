ActiveSupport.on_load(:active_record) do
  require 'cancancan'
end
