class MyControllerSpecGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate_my_controller_spec
    template "my_controller_spec.rb.erb", "spec/controllers/#{class_name.pluralize}_controller_spec.rb"
  end

  private

  def class_name
    file_name.underscore.singularize
  end

end
