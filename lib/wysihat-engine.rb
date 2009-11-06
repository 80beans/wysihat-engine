require 'paperclip'

module ActionView
  module Helpers
    module FormHelper
      def wysihat_editor(object_name, method, options = {})
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_wysihat_editor_tag(options)
      end
    end
  
    class InstanceTag #:nodoc:
      def to_wysihat_editor_tag(options = {})
        options = DEFAULT_TEXT_AREA_OPTIONS.merge(options.stringify_keys)
        add_default_name_and_id(options)

        if size = options.delete("size")
          options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
        end
        
        buttons, helpers = '', ''
        
        if options['buttons'] == nil || options['buttons'] == :all
          options['buttons'] = [:bold, :italic, :underline, :strikethrough, :justify_left, :justify_center, :justify_right, :insert_ordered_list, :insert_unordered_list, :undo, :redo, :link, :html, :image]
        end
 
        content_tag(
          :script,
          "Event.observe(window, 'load', function() {" <<
          "WysiHatify('#{tag_id}', ['#{options.delete('buttons').join('\', \'')}']);" <<
          "});",
          :type => 'text/javascript'
        ) <<
        content_tag("textarea", html_escape(options.delete('value') || value_before_type_cast(object)), options.merge(:class => 'wysihat_editor'))
      end
    end
  
    class FormBuilder #:nodoc:
      def wysihat_editor(method, options = {})
        @template.wysihat_editor(@object_name, method, options)
      end
    end
  end
end