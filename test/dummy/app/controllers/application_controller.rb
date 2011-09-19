class ApplicationController < ActionController::Base
  include FilteredAttributes::Filters

  protect_from_forgery

  private

  def pass(attrs)
    Thread.current[:passed_params] = attrs
    render text: "ok"
  end
end
