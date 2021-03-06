module Hbase
  class Base

    include ActiveModel::AttributeMethods
    include ActiveModel::Validations
    include ActiveModel::Conversion

    extend ActiveModel::Naming
    extend ActiveModel::Translation

    attr_accessor :id


    attribute_method_prefix 'clear_'
    attribute_method_suffix '?'

    def self.attributes(*names)
      attr_accessor *names
      define_attribute_methods names
    end

    def persisted?
      self.id != nil
    end

    protected

    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end
  end
end