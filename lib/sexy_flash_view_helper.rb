# SexyFlash
module SexyFlashViewHelper

  #helper for flash messages
  def sexy_flash
    the_flash = ""
    flash.each do |key, msg|
      the_flash += content_tag(:div, msg, :class => 'flash', :id => "flash_#{key}")
      the_flash += content_tag :script, :type => 'text/javascript' do
          "$('flash_#{key}').style.display = 'none';" + 
          "new Effect.Appear('flash_#{key}', {duration: 1});"
      end
      the_flash += content_tag :script, :type => 'text/javascript' do
          "setTimeout(\"$('flash_#{key}').fade();\", 5000)"
      end
    end
    return the_flash
  end

end
