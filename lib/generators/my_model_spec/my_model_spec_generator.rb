class MyModelSpecGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_my_controller_spec
    template "my_model_spec.rb.erb", "spec/models/#{class_name.singularize}_spec.rb"
  end

  private

  def class_name
    file_name.underscore.singularize
  end

end
