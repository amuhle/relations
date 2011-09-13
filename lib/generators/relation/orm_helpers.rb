module Relation
  module Generators
    module OrmHelpers
      def model_exists?(model_name)
        File.exists?(File.join(destination_root, model_path(model_name) ))
      end

      def model_path(model_name)
        File.join("app", "models", "#{model_name}.rb")
      end
    end
  end
end
