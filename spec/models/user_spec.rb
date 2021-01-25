require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(password: "09393", name: "steve",
				      email: "steve@email.com") }
  describe "Validations" do
	it "is valid with valid attributes" do
	  expect(subject).to be_valid
	end
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password_digest) }
  end

  it { should have_many(:activities) }
  it { should have_many(:comments) }


end
