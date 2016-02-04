require_relative '../lib/cart.rb'

describe 'An instance of', Cart do

  before :each do
    @cart = Cart.new
  end

  it 'should be properly initialized' do
    expect(@cart).to be_a(Cart)
  end

  context 'when new' do
    it 'contains no items' do
      expect(@cart).to be_empty
    end

    it 'has a total value of $0.0' do
      expect(@cart.value).to equal(0)
    end
  end

  context 'with items' do
    it 'is no longer empty after adding an item' do
      @cart.add 'an item'
      expect(@cart).not_to be_empty
    end

    it "has a value equal to the sum of each item's value times its quantity" do
      cat = { name: :cat, value: -100, defenestrate: true }
      dog = { name: :dog, value: 200, defenestrate: false }
      items = [cat, cat, dog, cat, dog, dog]
      value = items.inject(0) { |sum, item| sum + item[:value] }
      items.each do |item|
        @cart.add item
      end
      expect(@cart.value).to equal(value)
    end

    it "has the same unique items count after a duplicate item is added" do
      cat = { name: :cat, value: -100, defenestrate: true }
      @cart.add cat
      count = @cart.unique_items_count
      @cart.add cat
      expect(@cart.unique_items_count).to equal(count)
    end

    it 'has an unique items count greater than 0' do
      cat = { name: :cat, value: -100, defenestrate: true }
      @cart.add cat
      expect(@cart.unique_items_count).to be > 0
    end

    it "has a unique items count equal to the previous count plus one, after a previously unseen item is added" do
      cat = { name: :cat, value: -100, defenestrate: true }
      @cart.add cat
      count = @cart.unique_items_count
      dog = { name: :dog, value: 200, defenestrate: false }
      @cart.add dog
      expected_count = count + 1
      expect(@cart.unique_items_count).to equal(expected_count)
    end
  end
end

