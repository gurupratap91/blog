require 'rails_helper'

describe WelcomeController do
  it 'should route get("/") to the action index' do
    #expect(:get => "/").to route_to('welcome#index')
    expect(get("/")).to route_to("welcome#index")
  end
end


