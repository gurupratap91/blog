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

  describe 'create' do
    context "when new article is posted" do
      subject {post :new}
      it 'should perform the create action of articles' do
        expect(subject).to have_http_status(:success)
        #expect(subject).to render_template(:new)
      end
    end

    context "when initialized" do
      subject(:article) {Article.new}
      it 'is a new article' do
        expect(article).to be_a_new(Article)
      end
    end

    context " redirects to show" do
      subject { post :create, :article => { :title => "Foo", :text => "Bar" } }
      it "redirects to article_url(@article)" do
        expect(subject).to redirect_to(article_url(assigns(:article)))
      end
    end
  end
end
