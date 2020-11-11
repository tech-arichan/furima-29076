require 'rails_helper'

RSpec.describe "ItemPurchases", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/item_purchases/index"
      expect(response).to have_http_status(:success)
    end
  end

end
