class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    quantity.times do
      self.total += price
      self.items << item
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      self.total *= (1 - (discount.to_f / 100))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
