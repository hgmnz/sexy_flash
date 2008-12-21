# Include hook code here
require File.dirname(__FILE__) + '/lib/sexy_flash_view_helper'
ActionView::Base.send( :include, SexyFlashViewHelper )
