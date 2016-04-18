require_relative  'entry'
require 'csv'

class AddressBook
    attr_reader :entries

    def initialize()
        @entries = []
    end

    def add_entry(n, pn, e)
        index = 0

        self.entries.each do |entry|
            if n < entry.name
                break
            end
            index+=1
        end

        self.entries.insert(index, Entry.new(n, pn, e))
    end

    def demolish_entries
        self.entries.clear
    end

    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end

    def binary_search(n)
        lower = 0
        upper = entries.length - 1

        while lower <= upper
            mid = (lower + upper) / 2
            mid_name = entries[mid].name

            if n == mid_name
                return entries[mid]
            elsif n < mid_name
                upper = mid - 1
            elsif n > mid_name
                lower = mid + 1
            end
        end

        return nil
    end

    def iterative_search(n)
        match = nil
        self.entries.each do |e|
            if e.name == n
                match = e
                break
            end
        end

        return match
    end
end