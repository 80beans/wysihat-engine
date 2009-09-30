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
            buttons << "toolbar.addButton({label : \'Image\', handler: function(editor) { return editor.faceBoxFile(editor); } })\n"
          when "link"
            buttons << "toolbar.addButton({label : \'Link\', handler: function(editor) { return editor.faceboxLink(editor); } })\n"
          when "html"
            buttons << "toolbar.addButton({label : \'HTML\', handler: function(editor) { return editor.faceboxHTML(editor); } })\n"
          when "paste"
            buttons << "toolbar.addButton({label : \'Paste\', handler: function(editor) { return editor.faceboxPaste(editor); } })\n"
          else
            buttons << "toolbar.addButton({label : \'#{b.to_s.split('_').map {|w| w.capitalize}.join}\'});\n"
          end
        end
        
        options.delete('buttons');
        
        content_tag(
          :script,
          "
          var WysihatHelper = {
            faceBoxFile: function()
            {
              facebox.loading();
              new Effect.Appear($('facebox'), {duration: .3});

              var fb  = facebox;
            	var url = '/wysihat_files/?editor=' + this.id

            	new Ajax.Request(url, {
            		method		: 'get',
            		onFailure	: function(transport){
            			fb.reveal(transport.responseText, null);
            		},
            		onSuccess	: function(transport){
            			fb.reveal(transport.responseText, null);
            		}
            	});
            },
            
            faceboxLink: function()
            {
              if (this.linkSelected()) {
                this.unlinkSelection();
              } else {
                facebox.loading();
                new Effect.Appear($('facebox'), {duration: .3});
                iframe = this
                facebox.reveal('<input type=\"text\" id=\"link_field\" style=\"width:100%;\"/>', null);         
                Event.observe('link_field', 'change', function(event) {
                  iframe.linkSelection($('link_field').value);
                });
              }
            },
            
            faceboxHTML: function()
            {
              facebox.loading();
              new Effect.Appear($('facebox'), {duration: .3});
              iframe = this
              facebox.reveal('<textarea id=\"html_editor\" style=\"width:100%; height:400px;\">' + iframe.contentWindow.document.body.innerHTML + '</textarea>', null);         
              Event.observe('html_editor', 'change', function(event) {
                iframe.contentWindow.document.body.innerHTML = $('html_editor').value;
              });
            },
            
            faceboxPaste: function()
            {
              facebox.loading();
              new Effect.Appear($('facebox'), {duration: .3});
              iframe = this
              facebox.reveal('<textarea id=\"paste_editor\" style=\"width:100%; height:400px;\"></textarea>', null);         
              Event.observe('paste_editor', 'change', function(event) {
                iframe.contentWindow.document.body.innerHTML = iframe.contentWindow.document.body.innerHTML + $('paste_editor').value.escapeHTML();
              });
            }
          }
          
          WysiHat.Editor.include(WysihatHelper);
          
          Event.observe(window, 'load', function() {
            var editor = WysiHat.Editor.attach('#{tag_id}');
            var toolbar = new WysiHat.Toolbar(editor);
            #{buttons}
            
            $$('form').first().onsubmit = function(){ 
              editor.save();
            };
            
          });
          ",
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