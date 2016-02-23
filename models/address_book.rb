require_relative  'entry'

class AddressBook
    attr_reader :entries

    def initialize()
        @entries = []
    end

    def add_entry(n, pn, e)
        index = 0

        self.entries.each do |entry|
            if name < entry.name
                break
            end
            index+=1
        end

        self.entries.insert(index, Entry.new(n, pn, e))
    end

    def remove_entry(n, pn, e)
        self.entries.each_with_index do |entry, i|
            self.entries.delete_at(i) if entry.name == n && entry.phone_number == pn && entry.email == e
        end
    end
end