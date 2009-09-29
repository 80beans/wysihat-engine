namespace :wysihat_engine do 
  desc "Sync the migration & initialize-files to the main app."
  task :sync do
    system "rsync -ruv vendor/plugins/wysihat-engine/db/migrate db"
    system "rsync -ruv vendor/plugins/wysihat-engine/config/initializers/form_builder.rb config/initializers"
    system "rsync -ruv vendor/plugins/wysihat-engine/public/javascripts public"
    system "rsync -ruv vendor/plugins/wysihat-engine/public/stylesheets public"
    system "rsync -ruv vendor/plugins/wysihat-engine/public/images public"
    system "rsync -ruv vendor/plugins/wysihat-engine/vendor/plugins vendor"
    system "rsync -ruv vendor/plugins/wysihat-engine/lib/wysihat_engine.rb lib"
  end
end