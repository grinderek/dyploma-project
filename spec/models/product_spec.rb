# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject do
    build(:product)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid without a description' do
    subject.description = nil
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a vendor code' do
    subject.code = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when name is shorter than 2 or longer than 500' do
    subject.name = 'a'
    expect(subject).to_not be_valid
    subject.name = 'a' * 501
    expect(subject).to_not be_valid
  end

  it "is not valid when vendor code's length is not 7" do
    subject.code = 'asvadd'
    expect(subject).to_not be_valid
    subject.code = 'acasd12ae'
    expect(subject).to_not be_valid
  end

  it "is not valid when vendor code is not alphanumeric" do
    subject.code = 'a12xzs!'
    expect(subject).to_not be_valid
  end

  it "is not valid when price is longer than 7" do
    subject.price = 13214121
    expect(subject).to_not be_valid
  end

  it "is not valid when price is not only numeric" do
    subject.price = "123sx1"
    expect(subject).to_not be_valid
  end

  it "is not valid when description is longer than 5000" do
    subject.description = "a" * 5001
    expect(subject).to_not be_valid
  end
end
