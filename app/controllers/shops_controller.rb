# frozen_string_literal: true
class ShopsController < ApplicationController

  def show
    if headers_match? && load_store
      render json: { merchant_token: @store.merchant_token, status: 200 }
    else
      render json: { "message": 'Invalid Request', status: 400 }
    end
  end

  private

  def headers_match?
    request.headers['origin'] == params["shop"]
  end

  def load_store
    @store = Shop.find_by_shopify_domain(params["shop"])
  end
end
