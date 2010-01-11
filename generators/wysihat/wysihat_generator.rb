class WysihatGenerator < Rails::Generator::Base
  default_options :stylesheet => true, :js_src => false, :sass => false
    
  def manifest
    record do |m|                                                            
      
      m.file 'javascripts/wysihat_engine_pack.js', 'public/javascripts/wysihat_engine_pack.js'
      
      if options[:js_src]
        m.file 'javascripts/facebox.js',        'public/javascripts/facebox.js'
        m.file 'javascripts/wysihat.js',        'public/javascripts/wysihat.js'
        m.file 'javascripts/wysihat_engine.js', 'public/javascripts/wysihat_engine.js'
      end

      # facebox
      
      if options[:sass]
        m.directory 'public/stylesheets/sass'
        m.file 'sass/facebox.sass', 'public/stylesheets/sass/facebox.sass'
      else
        m.file 'css/facebox.css',   'public/stylesheets/facebox.css'
      end
      
      m.directory 'public/images/facebox'
      m.file 'images/facebox/b.png',                  'public/images/facebox/b.png'      
      m.file 'images/facebox/bl.png',                 'public/images/facebox/bl.png'      
      m.file 'images/facebox/br.png',                 'public/images/facebox/br.png'      
      m.file 'images/facebox/closelabel.gif',         'public/images/facebox/closelabel.gif'
      m.file 'images/facebox/tl.png',                 'public/images/facebox/tl.png'      
      m.file 'images/facebox/tr.png',                 'public/images/facebox/tr.png'
      m.file 'images/facebox/loading.gif',            'public/images/facebox/loading.gif'
      
      # stylesheet & icons
      
      if options[:stylesheet]
        if options[:sass]                        
          m.file 'sass/wysihat.sass', 'public/stylesheets/sass/wysihat.sass'
        else
          m.file 'css/wysihat.css',   'public/stylesheets/wysihat.css'
        end
        
        m.directory 'public/images/icons'
        m.file 'images/icons/arrow_redo.png',         'public/images/icons/arrow_redo.png'      
        m.file 'images/icons/arrow_undo.png',         'public/images/icons/arrow_undo.png'
        m.file 'images/icons/exclamation.png',        'public/images/icons/exclamation.png'      
        m.file 'images/icons/image.png',              'public/images/icons/image.png'      
        m.file 'images/icons/link.png',               'public/images/icons/link.png'      
        m.file 'images/icons/page_code.png',          'public/images/icons/page_code.png'      
        m.file 'images/icons/text_align_center.png',  'public/images/icons/text_align_center.png'      
        m.file 'images/icons/text_align_left.png',    'public/images/icons/text_align_left.png'      
        m.file 'images/icons/text_align_right.png',   'public/images/icons/text_align_right.png'      
        m.file 'images/icons/text_bold.png',          'public/images/icons/text_bold.png'           
        m.file 'images/icons/text_italic.png',        'public/images/icons/text_italic.png'      
        m.file 'images/icons/text_list_bullets.png',  'public/images/icons/text_list_bullets.png'      
        m.file 'images/icons/text_list_numbers.png',  'public/images/icons/text_list_numbers.png'      
        m.file 'images/icons/text_strikethrough.png', 'public/images/icons/text_strikethrough.png'      
        m.file 'images/icons/text_underline.png',     'public/images/icons/text_underline.png'
        m.file 'images/icons/text_heading_1.png',     'public/images/icons/text_heading_1.png'
        m.file 'images/icons/text_heading_2.png',     'public/images/icons/text_heading_2.png'
        m.file 'images/icons/text_heading_3.png',     'public/images/icons/text_heading_3.png'
        m.file 'images/icons/text_heading_4.png',     'public/images/icons/text_heading_4.png'
        m.file 'images/icons/text_heading_5.png',     'public/images/icons/text_heading_5.png'
        m.file 'images/icons/text_heading_6.png',     'public/images/icons/text_heading_6.png'
        m.file 'images/icons/cancel.png',             'public/images/icons/cancel.png'
      end

      m.migration_template                    'migrations/create_wysihat_files.rb',
                                              'db/migrate',
                                              :migration_file_name => 'create_wysihat_files'
           
      m.route_resources :wysihat_files
      
      m.system 'script/plugin install git://github.com/markcatley/responds_to_parent.git'
      
    end
  end
  
  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on('--no-stylesheet',   'Don\'t add the stylesheet file and don\'t copy the included icons.') { |v| options[:stylesheet] = false }
    opt.on('--include-js-src',  'Also copy the javascript source files.')                             { |v| options[:js_src] = true }
    opt.on('--sass',            'Copy sass stylesheets instead of css.')                              { |v| options[:sass] = true }
  end
    
end