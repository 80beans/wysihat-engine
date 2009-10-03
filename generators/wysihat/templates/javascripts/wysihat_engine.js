var toolbars = [];

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
	$$('textarea').each(function(i){   
    var editor = WysiHat.Editor.attach(i.id);
    var toolbar = new WysiHat.Toolbar(editor);
		toolbars[i.id] = toolbar;
  });
 	  
  $$('form').each().onsubmit = function(){ 
    editor.save();
  };
});