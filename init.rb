# Include hook code here
require File.dirname(__FILE__) + '/lib/sexy_flash_view_helper'
require File.dirname(__FILE__) + '/lib/core_ext'
ActionView::Base.send( :include, SexyFlashViewHelper )
