require 'rails_helper'

RSpec.describe Api::InstitutionsController, type: :controller do
  describe '#index' do
    before { create_list(:institution, 2) }

    it 'returns a success http status' do
      get :index
      expect(response).to be_success
    end

    it 'returns a list with all the created institutions' do
      get :index
      expect(response.body).to eq(Institution.all.to_json)
    end
  end
end
