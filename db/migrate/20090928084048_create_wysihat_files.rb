class CreateWysihatFiles < ActiveRecord::Migration
  def self.up
    create_table :wysihat_files do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :wysihat_files
  end
end
