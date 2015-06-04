require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Valid Title' do
    it 'should validate a valid title' do
      article = Article.create(:title => "asasas", :text => "abcd")
      expect(article).to be_valid
    end

    it 'should not validate an invalid title' do
      article = Article.create(:title => "", :text => "abcd")
      expect(article).not_to be_valid
    end
  end

  pending "add some examples to (or delete) #{__FILE__}"
end
