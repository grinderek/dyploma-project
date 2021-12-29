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
end
