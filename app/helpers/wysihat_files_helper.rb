module WysihatFilesHelper
  def include_link(file)
    function = file.file_content_type.starts_with?('image') ?
      ".insertImage(this.href);" :
      ".insertHTML('<a href=\"' + this.href + '\">#{file.file_file_name}</a>');"
          
    link_to_function(
      file.file_file_name,
      "$$('iframe##{params[:editor]}')[0]#{function}facebox.close();",
      :href => file.file.url
    )
  end
end
