module FilteredAttributes
  module Filters
    extend ActiveSupport::Concern

    module ClassMethods
      def filter_attributes_for(resource_name, options={})
        default_options = {as: resource_name, allow: []}
        options.reverse_merge! default_options
        options[:allow] = options[:allow].map {|k| k.to_s}

        define_method "#{options[:as]}_attributes" do
          instance_variable_get "@_#{options[:as]}_attributes"
        end

        self.send :private, "#{options[:as]}_attributes".to_sym

        filter_params = {}
        if options[:only]
          filter_params[:only] = options[:only]
        elsif options[:except]
          filter_params[:except] = options[:except]
        end

        self.send :before_filter, filter_params do
          if params[resource_name]
            instance_variable_set "@_#{options[:as]}_attributes", HashWithIndifferentAccess.new(
              params[resource_name].select {|k,v| options[:allow].include?(k.to_s)}
            )
          end
        end
      end
    end
  end
end

