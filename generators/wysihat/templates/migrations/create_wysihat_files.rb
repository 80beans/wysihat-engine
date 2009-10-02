class CreateWysihatFiles < ActiveRecord::Migration
  def self.up
    create_table :wysihat_files do |t|
      t.string     :file_file_name     
      t.string     :file_content_type  
      t.integer    :file_file_size     
      t.datetime   :file_updated_at    
      t.timestamps
    end
  end

  def self.down
    drop_table :wysihat_files
  end
end