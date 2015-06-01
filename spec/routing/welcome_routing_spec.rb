require 'rails_helper'

RSpec.describe WelcomeController do
  it 'should route to the action index' do
    #expect(:get => "/").to route_to('welcome#index')
    expect(get("/")).to route_to("welcome#index")
  end
end
