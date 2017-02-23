require 'rails_helper'

describe WordsController do
  describe "Get index" do
    it "sets @words" do
      get :index
      expect(assigns(:words)).to be_instance_of(WillPaginate::Collection)
    end

    it "defaults to 1000 numbers per page" do
      get :index
      expect(assigns(:words).size).to eq(1000)
    end

    it "defaults to the first page of the list if none is set" do
      get :index
      expect(assigns(:words)[0]).to eq("one")
    end

    context "with page parameter set" do
      it "should return the correct words list given the page and per_page params" do
        get :index, page: 3
        expect(assigns(:words).size).to eq(1000)
        expect(assigns(:words)[0]).to eq("two thousand and one")
      end
    end

    context "with display per page set" do
      it "sets the words array to be of the correct length" do
        get :index, per_page: "50"
        expect(assigns(:words).size).to eq(50)
      end
    end
  end
end