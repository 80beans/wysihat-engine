var toolbars = [];

var WysihatHelper = {
  faceboxFile: function()
  {
    facebox.loading();
    new Effect.Appear($('facebox'), {duration: 0.3});

    var fb  = facebox;
    var url = '/wysihat_files/?editor=' + this.id;

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
      new Effect.Appear($('facebox'), {duration: 0.3});
      iframe = this;
      facebox.reveal('<input type=\"text\" id=\"link_field\" style=\"width:100%;\"/>', null);         
      Event.observe('link_field', 'change', function(event) {
        iframe.linkSelection($('link_field').value);
      });
    }
  },
  
  faceboxHTML: function()
  {
    facebox.loading();
    new Effect.Appear($('facebox'), {duration: 0.3});
    iframe = this;
    facebox.reveal('<textarea id=\"html_editor\" style=\"width:100%; height:400px;\">' + iframe.contentWindow.document.body.innerHTML + '</textarea>', null);         
    Event.observe('html_editor', 'change', function(event) {
      iframe.contentWindow.document.body.innerHTML = $('html_editor').value;
    });
  }
};

WysiHat.Editor.include(WysihatHelper);

Event.observe(window, 'load', function() {
	$$('textarea.wysihat_editor').each(function(i){   
    var editor = WysiHat.Editor.attach(i.id);
    var toolbar = new WysiHat.Toolbar(editor);
		toolbars[i.id] = toolbar;
		
		editor.observe("wysihat:paste", function(event) {
      setTimeout(function() {
        event.target.reload();
      }, 1);
    });
		
		$$('form').each(function(f){
			f.onsubmit = function(){
				editor.save();
			};
		});
  });
});

function addButtons(tag_id, buttons){
	Event.observe(window, 'load', function() {
		buttons.each(function(button){
			
			switch(button.toLowerCase()){
				case 'image':
					toolbars[tag_id].addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxFile(editor); }}); 
				break;
				case 'link':
					toolbars[tag_id].addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxLink(editor); }}); 
				break;
				case 'html':
					toolbars[tag_id].addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxHTML(editor); }}); 
				break;
				case 'paste':
					toolbars[tag_id].addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxPaste(editor); }}); 
				break;
				default:
					toolbars[tag_id].addButton({label : button.gsub('_','-').camelize().capitalize()});
			}
		});                                        
	});
}