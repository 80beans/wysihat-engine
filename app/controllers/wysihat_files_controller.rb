class WysihatFilesController < ResourceController::Base
  index.before do
    @wysihat_file = WysihatFile.new
  end
  
  #create do
  #  responds_to_parent do
  #    render :update do |page|
  #      if(@wysihat_file.save)
  #        page.insert_html :bottom, :wysihat_files, :partial => 'wysihat_file', :object => @wysihat_file  
  #      end
  #    end      
  #  end
  #end
  def create
    @wysihat_file = WysihatFile.new(params[:wysihat_file])
    
    responds_to_parent do
      render :update do |page|
        if(@wysihat_file.save)
          page.insert_html :bottom, :wysihat_files, :partial => 'wysihat_file', :object => @wysihat_file  
        end
      end      
    end
  end
end