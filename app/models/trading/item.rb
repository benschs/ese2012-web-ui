module Trading

  class Item

    attr_accessor :name, :price, :owner, :active, :ownerName

    def self.make (name, price)
      item = self.new
      item.name = name
      item.price = price
      item
    end

    def initialize
      self.owner = nil
      self.ownerName = nil
      self.active = false
    end

    def to_s
      status = "active"
      status = "inactive" if !self.active

      "Name: #{self.name}, price: #{self.price}, status: #{status}, owner: #{self.ownerName}"
    end

  end

end