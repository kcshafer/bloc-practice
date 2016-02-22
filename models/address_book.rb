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
end