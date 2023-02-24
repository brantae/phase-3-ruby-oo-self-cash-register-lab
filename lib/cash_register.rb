require 'pry'

class CashRegister
    attr_accessor :discount, :total, :title, :price, :quantity, :items, :last_transaction

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        unless discount == 0
            @total -= (@total * discount / 100) 
            return "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end


    def void_last_transaction
        self.total -= self.last_transaction
    end

end
