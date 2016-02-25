require_relative '../models/address_book'

class Menu
    attr_accessor :address_book

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu
        puts "Main Menu - #{@address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View Entry Number n"
        puts "6 - Exit"
        print "Enter your selection: "

        selection = gets.to_i
        
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                create_entry
                main_menu
            when 3
                system "clear"
                search_entries
                main_menu
            when 4
                system "clear"
                read_csv
                main_menu
            when 5
                system "clear"
                view_entry
            when 6
                puts "Good-bye!"
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu 
        end
    end

    def view_all_entries
        self.address_book.entries do |entry|
            system "clear"
            puts entry.to_S

            entry_submenu(entry)
        end

        system "clear"
        puts "End of entries"
    end

    def view_entry
        puts "Entry Number: "
        entry_str_num = gets.chomp
        #in order for this to work, this should be an integer
        begin
            entry_num = Integer(entry_str_num)
            #convert the entered nunber into array index by subtracting 1
            entry_num = entry_num - 1
        rescue Exception => e
             puts "Entry is not an integer"
        end

        #make sure that the given number has a valid entry at that index
        if self.address_book.entries[entry_num] != nil and entry_num >= 0 then
            puts self.address_book.entries[entry_num].to_s
        else
            puts "Please enter a valid number."
        end
            
    end

    def entry_submenu(entry)
        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit this entry"
        puts "m - return to main menu"

        selection = gets.chomp

        case selection
            when "n"
            when "d"
            when "e"
            when "m" 
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
    end

    def create_entry
        print "Name: "
        name = gets.chomp
        print "Phone number: "
        phone_number = gets.chomp
        print "Email: "
        email = gets.chomp

        self.address_book.add_entry(name, phone_number, email)

        system "clear"
        puts "New entry created"
    end

    def search_entries
    end

    def read_csv
    end
end