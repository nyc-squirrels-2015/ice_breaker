require_relative '../spec_helper'

class QuoteSpec
  describe 'quotes' do
    category = Category.create(name:"Funny")
    subcategory = Subcategory.create(name:"Punny", category: category)
    user = User.create(name: "Gary", email: "gary@gary.com", password: "gary")

    let(:quote) { Quote.create(text: "I like cats", user: user, subcategory: subcategory)}

      before do
        quote
      end

      it 'should respond to /new' do
      post "/categories/#{category.id}/subcategories/#{subcategory.id}/quotes/new", params={ quote: {text: 'Did you know that the average 4 year old asks over four hundred questions a day.', user: user, subcategory: subcategory}}
      expect(last_response).to be_redirect
    end

    it 'should respond to /quotes/quote.id/update' do
      get "/categories/#{category.id}/subcategories/#{subcategory.id}/quotes/#{quote.id}/update", {}, {'rack.session' =>  { :user => user.id } }
      expect(last_response).to be_ok
      expect(last_response.body).to include 'update'
      expect(last_response.body).to include 'I like cats'
    end
  end
end
