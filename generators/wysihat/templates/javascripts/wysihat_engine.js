var editors = [];

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

function wysiHatify(tag_id, buttons){
  WysiHat.Editor.include(WysihatHelper);
  var editor = WysiHat.Editor.attach(tag_id);
  var toolbar = new WysiHat.Toolbar(editor);

  editors.push(editor);

	$$('form').each(function(f){
	  f.onsubmit = function(){
	    editors.each(function(e){
	      e.save();
	    });
	  };
	});

	buttons.each(function(button){
		switch(button.toLowerCase()){
			case 'image':
				toolbar.addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxFile(editor); }});
			break;
			case 'link':
				toolbar.addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxLink(editor); }});
			break;
			case 'html':
				toolbar.addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxHTML(editor); }});
			break;
			case 'paste':
				toolbar.addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.faceboxPaste(editor); }});
		  case 'h1': case 'h2': case 'h3': case 'h4': case 'h5': case 'h6': case 'p':
			  toolbar.addButton({label : button.gsub('_','-').camelize().capitalize(), handler: function(editor) { return editor.formatblockSelection(button.toLowerCase()); }});	
			break;
			default:
		    toolbar.addButton({label : button.gsub('_','-').camelize().capitalize()});
	  }
	});
}
