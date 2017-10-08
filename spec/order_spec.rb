require 'order'

describe Order do

  let(:menu) { double(:menu, menu_items: [{item_num: 1, item: "Murgh Masala", cost: 6.9}]) }
  let(:basket) { double(:basket, new_item: nil) }
  subject(:order) { described_class.new(menu, basket) }


  describe "#select_item" do

    it "exists" do
      expect(order).to respond_to(:select_item)
    end

    it "accepts user input for item_num" do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect($stdin).to receive(:gets)
      order.select_item
    end

    it "calls #select_quantity" do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect(order).to receive(:select_quantity)
      order.select_item
    end

  end

  describe "#add_to_basket" do

    it "sends new item to basket" do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect(basket).to receive(:new_item).with({ item: "Murgh Masala", quantity: 1, cost: 6.9 })
      order.select_item
    end

  end

  describe "#initialize" do

    it "instantiates with a menu" do
      expect(order.order_menu).to eq(menu)
    end

    it "instantiates with a basket" do
      expect(order.order_basket).to eq(basket)
    end

  end

end
