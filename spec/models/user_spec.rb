require 'rails_helper'

RSpec.describe User, type: :model do
	subject { described_class.new(password: "09393",
				      email: "steve@email.com") }
	describe "Validations" do
	  it "is valid with valid attributes" do
	    expect(subject).to be_valid
	  end
	end
end
