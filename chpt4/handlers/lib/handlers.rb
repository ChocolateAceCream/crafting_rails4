
ActionView::Template.register_template_handler :rb, :source.to_proc

ActionView::Template.register_template_handler :string,
  lambda { |template| "%Q{#{template.source}}" }
