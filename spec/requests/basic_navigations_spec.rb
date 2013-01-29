require 'spec_helper'

describe "BasicNavigations" do
	it "should have all pages responding OK" do
		# Run the generator again with the --webrat flag if you want to use webrat methods/matchers
		for page in %w"about contato index" do
			get page
			response.status.should be(200)
		end
	end
end
