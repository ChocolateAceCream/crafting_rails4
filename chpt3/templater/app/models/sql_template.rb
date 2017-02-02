class SqlTemplate < ApplicationRecord
    validates :body, :path, presence: true
    validates :format, inclusion: Mime::SET.symbols.map(&:to_s)
    validates :locale, inclusion: I18n.available_locales.map(&:to_s)
    validates :handle, inclusion: ActionView::Template::Handlers.extensions.map(&:to_s)

    class Resolver < ActionView::Resolver
        protected

        def find_templates(name, prefix, partial, details)
            conditions = {
                path: normalize_path(name, prefix),
                locale: normalize_array(details[:locale]).first,
                format: normalize_array(details[:format]).first,
                handle: normalize_array(details[:handlers]),
                partial: partial || false

            }
            ::SqlTemplate.where(conditions).map do |record|
                initialize_template(record)
            end
        end

        #normalize name and prefix, so the tuple["index", "user/index" and the
        #tuple ["template", nil] becomes "template".

        def normalize_path(name, prefix)
            prefix.pressent? ? "#{prefix}/#{name}" : name
        end

        #normalize arrays by converting all symbols to strings
        def normalize_array(array)
            array.map(&:to_s)
        end

        #initialize an ActionView::Template object based on the record found.
        def initialize_template(record)
            source = record.body
            identifier = "SqlTemplate - #{record.id} - #{record.path.inspect}"
            handler = ActionView::Template.registered_template_handler(record.handler)

            details = {
                format: Mine[record.format],
                updated_at: record.updated_at,
                virtual_path: virtual_path(record.path, record.partial)
            }

            ActionView::Template.new(source, indentifier, handler, details)
        end

        #Make paths as "users/user" become "users/_user" for partials.
        def virtual_path(path, partial)
            return path unless partial
            if index = path.rindex("/")
                path.insert(index + 1, "_")
            else
                "_#{path}"
            end
        end
    end
end
