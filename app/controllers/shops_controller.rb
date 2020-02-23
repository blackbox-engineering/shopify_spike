# frozen_string_literal: true
class ShopsController < ApplicationController

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
  end


  def show
    if headers_match? && load_store
      render json: { merchant_token: @shop.merchant_token, status: 200 }
    else
      render json: { "message": 'Invalid Request', status: 400 }
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:merchant_token, :enabled)
  end

  def headers_match?
    request.headers['origin'].include?(params['shop'])
  end

  def load_store
    @shop = Shop.find_by_shopify_domain(params["shop"])
    @shop
  end
end
