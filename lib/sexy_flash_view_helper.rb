# SexyFlash
module SexyFlashViewHelper

  #helper for flash messages
  # == Options
  # * timeout: Flash timeout in seconds
  # * duration: Flash effect duration
  # ==
  # i.e: sexy_flash :timeout => 2, :duration => 1, :show_effect => "BlindDown", :hide_effect => "BlindUp"
  # If :timeout is set to be 0 or less then 0. Don't hide the flash message  
  #
  # These same options can be overwritten at when creating the flash, and for that flash message only:
  #
  # i.e:
  # flash[:notice] = 'I just want you to know', {:timeout => 0, :show_effect => 'BlindDown' }
  def sexy_flash(view_options = {})
    the_flash = ""

    global_timeout = view_options.has_key?(:timeout) ? view_options[:timeout]*1000 : 5
    global_duration = view_options[:duration] || 1
    global_show_effect = view_options[:show_effect] || 'Appear'
    global_hide_effect = view_options[:hide_effect] || 'Fade'

    [:error, :warning, :info, :notice].each do |key|
      if flash.has_key?(key)
        #set options specific to this flash message:
        flash_options = flash[(key.to_s + '_options').to_sym]
        timeout = flash_options.has_key?(:timeout) ? flash_options[:timeout]*1000 : global_timeout
        duration = flash_options[:duration] || global_duration
        show_effect = flash_options[:show_effect] || global_show_effect
        hide_effect = flash_options[:hide_effect] || global_hide_effect

        the_flash += content_tag(:div, flash[key], :class => 'flash', :id => "flash_#{key}")
        the_flash += content_tag :script, :type => 'text/javascript' do
            "$('flash_#{key}').style.display = 'none';" + 
            "new Effect.#{show_effect}('flash_#{key}', {duration: #{duration}});"
        end
        if timeout > 0
          the_flash += content_tag :script, :type => 'text/javascript' do
            "setTimeout(\"Effect.#{hide_effect}('flash_#{key}')\", #{timeout})"
          end
        end #if timeout > 0
      end #if flash.has_key?(key)
    end #each do |key|
    return the_flash
  end 

end
