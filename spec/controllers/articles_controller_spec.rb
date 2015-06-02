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

  #Functionality of create is to create an article using the given parameters
  #and redirect to the show url of the article
  context 'create' do
    it "should create new article" do
      expect(Article.count).to eq 0
      post :create, :article => { :title => "Foo", :text => "Bar"}

      expect(Article.count).to eq 1
      expect(assigns(:article).title).to eq("Foo")
      expect(assigns(:article).text).to eq("Bar")
    end

    it "should redirect to show page" do
     post :create, :article => { :title => "Foo", :text => "Bar"}
     expect(assigns(:article)).to redirect_to(article_url(assigns(:article)))
    end
  end
end
