# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wysihat-engine}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Kreeftmeijer"]
  s.date = %q{2009-10-03}
  s.description = %q{A rails engine to allow users to use the WysiHat editors.}
  s.email = %q{jeff@80beans.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "app/controllers/wysihat_files_controller.rb",
     "app/helpers/wysihat_files_helper.rb",
     "app/models/wysihat_file.rb",
     "app/views/wysihat_files/_form.html.erb",
     "app/views/wysihat_files/_wysihat_file.html.erb",
     "app/views/wysihat_files/index.html.erb",
     "app/views/wysihat_files/new.html.erb",
     "generators/wysihat/templates/images/arrow_redo.png",
     "generators/wysihat/templates/images/arrow_undo.png",
     "generators/wysihat/templates/images/b.png",
     "generators/wysihat/templates/images/bl.png",
     "generators/wysihat/templates/images/br.png",
     "generators/wysihat/templates/images/closelabel.gif",
     "generators/wysihat/templates/images/exclamation.png",
     "generators/wysihat/templates/images/film.png",
     "generators/wysihat/templates/images/image.png",
     "generators/wysihat/templates/images/link.png",
     "generators/wysihat/templates/images/loading.gif",
     "generators/wysihat/templates/images/page_code.png",
     "generators/wysihat/templates/images/page_white_flash.png",
     "generators/wysihat/templates/images/paste_plain.png",
     "generators/wysihat/templates/images/text_align_center.png",
     "generators/wysihat/templates/images/text_align_left.png",
     "generators/wysihat/templates/images/text_align_right.png",
     "generators/wysihat/templates/images/text_bold.png",
     "generators/wysihat/templates/images/text_heading_1.png",
     "generators/wysihat/templates/images/text_heading_2.png",
     "generators/wysihat/templates/images/text_heading_3.png",
     "generators/wysihat/templates/images/text_italic.png",
     "generators/wysihat/templates/images/text_list_bullets.png",
     "generators/wysihat/templates/images/text_list_numbers.png",
     "generators/wysihat/templates/images/text_strikethrough.png",
     "generators/wysihat/templates/images/text_underline.png",
     "generators/wysihat/templates/images/tl.png",
     "generators/wysihat/templates/images/tr.png",
     "generators/wysihat/templates/javascripts/facebox.js",
     "generators/wysihat/templates/javascripts/wysihat.js",
     "generators/wysihat/templates/migrations/create_wysihat_files.rb",
     "generators/wysihat/templates/stylesheets/facebox.css",
     "generators/wysihat/templates/stylesheets/wysihat.css",
     "generators/wysihat/wysihat_generator.rb",
     "lib/wysihat-engine.rb",
     "vendor/plugins/responds_to_parent/MIT-LICENSE",
     "vendor/plugins/responds_to_parent/README",
     "vendor/plugins/responds_to_parent/Rakefile",
     "vendor/plugins/responds_to_parent/init.rb",
     "vendor/plugins/responds_to_parent/lib/parent_selector_assertion.rb",
     "vendor/plugins/responds_to_parent/lib/responds_to_parent.rb",
     "vendor/plugins/responds_to_parent/rails/init.rb",
     "vendor/plugins/responds_to_parent/responds-to-parent.gemspec",
     "vendor/plugins/responds_to_parent/test/assert_select_parent_test.rb",
     "vendor/plugins/responds_to_parent/test/responds_to_parent_test.rb",
     "wysihat-engine.gemspec"
  ]
  s.homepage = %q{http://github.com/80beans/wysihat-engine}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A rails engine to allow users to use the WysiHat editors.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thoughtbot-paperclip>, [">= 0"])
      s.add_runtime_dependency(%q<giraffesoft-resource_controller>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-paperclip>, [">= 0"])
      s.add_dependency(%q<giraffesoft-resource_controller>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-paperclip>, [">= 0"])
    s.add_dependency(%q<giraffesoft-resource_controller>, [">= 0"])
  end
end
