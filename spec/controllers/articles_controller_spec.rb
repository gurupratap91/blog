require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  context 'index' do
    it 'should get ids of all articles' do
      article1 = Article.create(:title => "Fooppp",:text => "Bar")
      article = Article.create(:title => "Foosd",:text => "Bar")
      #articles = Article.all
      #get :index, :articles => articles
      #expect(assigns(:articles)).to eq(Article.all)
      get :index
      expect(assigns(:articles)).to eq(Article.all)
    end

    it 'should render the index page of articles' do
      expect(get :index).to render_template(:index)
    end
  end

  context 'new' do
    subject {get :new}
    it "should render the new article page" do
      #expect(get :new).to render_template(:new)
      expect(subject).to have_http_status(:success)
      expect(subject).to render_template(:new)
    end
  end

  context 'show' do
    #useless test article should not be created in this way
    it 'should find the article with given id' do
      article1 = Article.create(:title => "Fooppp",:text => "Bar")
      post :create, :article =>{:title => "Foosd", :text => "Bar"}
      id = article1.id
      get :show, :id => id
      #require 'pry'
      #binding.pry
      expect((assigns(:article)).id).to eq(id)
    end

    it 'should find the article with given id better test' do
      article = Article.create(:title => "Foosd",:text => "Bar")
      get :show, :id => article.id
      expect(assigns(:article).id).to eq(article.id)
    end

    it 'should render the show page of the article' do
      article = Article.create(:title => "Foosd",:text => "Bar")
      get :show, :id => article.id
      expect(assigns(:article)).to render_template(:show)
    end
  end

  #Functionality of create is to create an article using the given parameters
  #and redirect to the show url of the article
  context 'create' do
    it "should create new article" do
      expect(Article.count).to eq 0
      post :create, :article => { :title => "Foosd", :text => "Bar"}

      expect(Article.count).to eq 1
      expect(assigns(:article).title).to eq("Foosd")
      expect(assigns(:article).text).to eq("Bar")
    end

    it "should redirect to show page" do
     post :create, :article => { :title => "Foosd", :text => "Bar"}
     expect(assigns(:article)).to redirect_to(article_url(assigns(:article)))
    end
  end

  context 'edit' do
    it 'should find the argument whose id is passed' do
      article = Article.create(:title => 'FOOOO', :text => 'Bar')
      get :edit, :id => article.id
      expect(assigns(:article).id).to eq(article.id)
    end
  end

  context 'update' do
    it 'should find and update the article with given id' do
      article = Article.create(:title => 'FOOOO', :text => 'Bar')
      patch :update, :id => article.id, :article => {:title => "Foolish", :text => "Boy"}
      expect(assigns(:article).id).to eq(article.id)
      expect(assigns(:article).title).to eq("Foolish")
      expect(assigns(:article).text).to eq("Boy")
    end
  end

  context 'destroy' do
    it 'should find and destroy the given article' do
      article = Article.create(:title => 'FOOOO', :text => 'Bar')
      delete :destroy, :id => article.id
      expect(assigns(:article).id).to eq(article.id)
      expect(Article.count).to eq(0);
    end
  end
end
