require 'resource_controller'
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
        
        case options['buttons']
        when nil, :all
          options['buttons'] = [:bold, :italic, :underline, :strikethrough, :justify_left, :justify_center, :justify_right, :insert_ordered_list, :insert_unordered_list, :undo, :redo, :link, :html, :paste, :image]
        end
                      
        options['buttons'].each do |b|
          case b.to_s.downcase
          when "image"
            buttons << "toolbars['#{tag_id}'].addButton({label : \'Image\', handler: function(editor) { return editor.faceBoxFile(editor); } })\n"
          when "link"
            buttons << "toolbars['#{tag_id}'].addButton({label : \'Link\', handler: function(editor) { return editor.faceboxLink(editor); } })\n"
          when "html"
            buttons << "toolbars['#{tag_id}'].addButton({label : \'HTML\', handler: function(editor) { return editor.faceboxHTML(editor); } })\n"
          when "paste"
            buttons << "toolbars['#{tag_id}'].addButton({label : \'Paste\', handler: function(editor) { return editor.faceboxPaste(editor); } })\n"
          else
            buttons << "toolbars['#{tag_id}'].addButton({label : \'#{b.to_s.split('_').map {|w| w.capitalize}.join}\'});\n"
          end
        end
        
        options.delete('buttons');
        
        content_tag(
          :script,
          "Event.observe(window, 'load', function() {
            #{buttons}
           })",
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