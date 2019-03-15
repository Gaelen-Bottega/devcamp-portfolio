class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageTitle


  before_action :set_copyright

  def set_copyright
    @copyright = GaelenCopyright::Renderer.copyright 'Gaelen Rhoads', 'All Rights Reserved'
  end
end

