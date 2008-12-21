# Install hook code here
puts 'Copying stylesheet'
FileUtils.cp File.join(File.dirname(__FILE__), 'public/stylesheets/sexy_flash.css'), "#{RAILS_ROOT}/public/stylesheets/"
