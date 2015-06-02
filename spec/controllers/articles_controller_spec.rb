require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'new' do
   subject {get :new}
    it "should render the new article page" do
      #expect(get :new).to render_template(:new)
      expect(subject).to have_http_status(:success)
      expect(subject).to render_template(:new)
    end
  end
end
