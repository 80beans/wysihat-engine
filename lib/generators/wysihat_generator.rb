require 'rails/generators/migration'
class WysihatGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  
  def self.source_root
    File.join(File.dirname(__FILE__), '..', '..', 'generators', 'wysihat', 'templates')
  end
  
  def install_wysihat
    copy_file 'javascripts/wysihat_engine_pack.js', 'public/javascripts/wysihat_engine_pack.js'
     
    # javascript source
    # TODO: build the --include-js-src option
    
    # facebox
    # TODO: build the --sass option
     
    copy_file 'css/facebox.css',   'public/stylesheets/facebox.css'
     
    copy_file 'images/facebox/b.png',                  'public/images/facebox/b.png'      
    copy_file 'images/facebox/bl.png',                 'public/images/facebox/bl.png'      
    copy_file 'images/facebox/br.png',                 'public/images/facebox/br.png'      
    copy_file 'images/facebox/closelabel.gif',         'public/images/facebox/closelabel.gif'
    copy_file 'images/facebox/tl.png',                 'public/images/facebox/tl.png'      
    copy_file 'images/facebox/tr.png',                 'public/images/facebox/tr.png'
    copy_file 'images/facebox/loading.gif',            'public/images/facebox/loading.gif'
    
    # stylesheet
    # TODO: build the --sass option
      
    copy_file 'css/wysihat.css',   'public/stylesheets/wysihat.css'
    
    # icons
    
    copy_file 'images/icons/arrow_redo.png',         'public/images/icons/arrow_redo.png'      
    copy_file 'images/icons/arrow_undo.png',         'public/images/icons/arrow_undo.png'
    copy_file 'images/icons/exclamation.png',        'public/images/icons/exclamation.png'      
    copy_file 'images/icons/image.png',              'public/images/icons/image.png'      
    copy_file 'images/icons/link.png',               'public/images/icons/link.png'      
    copy_file 'images/icons/page_code.png',          'public/images/icons/page_code.png'      
    copy_file 'images/icons/text_align_center.png',  'public/images/icons/text_align_center.png'      
    copy_file 'images/icons/text_align_left.png',    'public/images/icons/text_align_left.png'      
    copy_file 'images/icons/text_align_right.png',   'public/images/icons/text_align_right.png'      
    copy_file 'images/icons/text_bold.png',          'public/images/icons/text_bold.png'           
    copy_file 'images/icons/text_italic.png',        'public/images/icons/text_italic.png'      
    copy_file 'images/icons/text_list_bullets.png',  'public/images/icons/text_list_bullets.png'      
    copy_file 'images/icons/text_list_numbers.png',  'public/images/icons/text_list_numbers.png'      
    copy_file 'images/icons/text_strikethrough.png', 'public/images/icons/text_strikethrough.png'      
    copy_file 'images/icons/text_underline.png',     'public/images/icons/text_underline.png'
    copy_file 'images/icons/text_heading_1.png',     'public/images/icons/text_heading_1.png'
    copy_file 'images/icons/text_heading_2.png',     'public/images/icons/text_heading_2.png'
    copy_file 'images/icons/text_heading_3.png',     'public/images/icons/text_heading_3.png'
    copy_file 'images/icons/text_heading_4.png',     'public/images/icons/text_heading_4.png'
    copy_file 'images/icons/text_heading_5.png',     'public/images/icons/text_heading_5.png'
    copy_file 'images/icons/text_heading_6.png',     'public/images/icons/text_heading_6.png'
    copy_file 'images/icons/cancel.png',             'public/images/icons/cancel.png'
    
    # migration
    
    migration_template 'migrations/create_wysihat_files.rb', 'db/migrate/create_wysihat_files.rb'
         
    # routes
    
    route 'resource :wysihat_files'
    
    # install the responds_to_parent plugin
    
    plugin 'responds_to_parent', :git => 'git://github.com/markcatley/responds_to_parent.git'
  end
  
  protected
    def next_migration_number(dirname) #:nodoc:
      "%.3d" % (current_migration_number(dirname) + 1)
    end
end