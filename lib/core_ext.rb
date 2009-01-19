#patch to vendor/rails/actionpack/lib/action_controller/flash.rb
ActionController::Flash::FlashHash.class_eval do

  def brackets_equal_with_sexy(k, v)
    v = Array(v)
    options = v.extract_options!
    brackets_equal_without_sexy(k, v[0])
    brackets_equal_without_sexy((k.to_s + '_options').to_sym, options)
  end

  alias_method :brackets_equal_without_sexy, :[]=
  alias_method :[]=, :brackets_equal_with_sexy

end
