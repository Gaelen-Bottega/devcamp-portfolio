module DefaultPageTitle
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Gaelen's Portfolio Website"
    @seo_keywords = "Gaelen Rhoads Portfolio"
  end
end