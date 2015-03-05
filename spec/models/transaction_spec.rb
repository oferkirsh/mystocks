require "spec_helper"
require 'shoulda/matchers'
require "money-rails/test_helpers"

describe Transaction do
	include MoneyRails::TestHelpers
	context "assosiations" do
		it { should belong_to(:user) }
		it { should belong_to(:stock) }
	end
	context "monitize" do
		it 'tax cents should be monitize' do
			transaction = create(:transaction,:the_stock)
		  	expect(transaction).to monetize(:tax_cents)
	  	end
  	end
end


