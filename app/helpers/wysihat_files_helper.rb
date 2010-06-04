module WysihatFilesHelper
  def include_link(file)    
    function = file.file_content_type.starts_with?('image') ?
      ".insertImage(this.href);" :
      ".insertHTML('<a href=\"' + this.href + '\">#{file.file_file_name}</a>');"
          
    link_to_function(
      file.file_file_name,
      "$$('iframe##{editor_id}')[0]#{function}facebox.close();",
      :href => file.file.url
    )
  end
  
  def editor_id
    return params[:wysihat_file][:editor] if params[:wysihat_file] && params[:wysihat_file][:editor]
    params[:editor]
  end
end
