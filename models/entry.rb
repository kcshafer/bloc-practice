class Entry
    attr_reader :name, :phone_number, :email

    def initialize(n, pn, e)
       @name         = n
       @phone_number = pn
       @email        = e 
    end

    def to_s
        return "Name: #{self.name}\nPhone Number: #{self.phone_number}\nEmail: #{self.email}"
    end
end