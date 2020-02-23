# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    @shop = Shop.find_by_shopify_domain(params[:shop])
  end
end
