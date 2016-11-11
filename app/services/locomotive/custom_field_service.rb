module Locomotive
  class CustomFieldService < Struct.new(:field)

    # Update the options of a "select" field.
    #
    # @param [ Hash ] options It includes the following keys: name, _id and _destroyed (if persisted)
    #
    # @return [ Array ] The new list of options
    #
    def update_select_options(options)
      return nil if options.blank?

      # set the right position
      options.each_with_index do |option, position|
        option['position'] = position
      end

      self.field.select_options_attributes = options

      self.field.save

      self.field.select_options
    end

  end
end
