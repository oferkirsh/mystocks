require "spec_helper"
require 'shoulda/matchers'

describe Transaction do
	it { should belong_to(:user) }
	it { should belong_to(:stock) }
end
