require 'rails_helper'

describe ArticlesController do
  it 'should route get("/articles") to the action index of resource articles' do
    expect(get("/articles")).to route_to("articles#index")
  end
  it 'should route post("/articles") to the action create of resource articles' do
    expect(post("/articles")).to route_to("articles#create")
  end
  it 'should route get("/articles/new") to the action new of resource articles' do
    expect(get("/articles/new")).to route_to("articles#new")
  end
  it 'should route get("/articles/:id/edit") to the action edit of resource articles' do
    article = Article.create(:title => "foooo", :text => "Bar")
    expect(get("/articles/#{article.id}/edit")).to route_to("articles#edit", id:"#{article.id}")
  end
  it 'should route get("/articles/:id") to the action show of resource articles' do
    expect(get("/articles/1")).to route_to("articles#show", id: "1")
  end
  it 'should route patch("/articles/:id") to the action update of resource articles' do
    expect(patch("/articles/1")).to route_to("articles#update", id:"1")
  end
  it 'should route put("/articles/:id") to the action update of resource articles' do
    expect(put("/articles/1")).to route_to("articles#update", id:"1")
  end
  it 'should route delete("/articles/:id") to the action destroy of resource articles' do
    expect(delete("/articles/1")).to route_to("articles#destroy", id:"1")
  end
end


