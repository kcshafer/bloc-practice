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

    def import_from_csv(file_name)
        csv_text = File.read(file_name)
        csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

        csv.each do |row|
            row_hash = row.to_hash
            add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
        end
    end
end