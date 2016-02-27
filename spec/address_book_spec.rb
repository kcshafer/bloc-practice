require_relative '../models/address_book'

RSpec.describe AddressBook do 
    let(:book) {AddressBook.new}

    def check_entry(entry, xName, xNumber, xEmail)
        expect(entry.name).to eq xName
        expect(entry.phone_number).to eq xNumber
        expect(entry.email).to eq xEmail
    end

    describe "attributes" do
        it "responds to entries" do 
            expect(book).to respond_to(:entries)
        end

        it "initializes entries as an array" do
            expect(book.entries).to be_an(Array)
        end

        it "initializes entries as empty" do
            expect(book.entries.size).to eq(0)
        end
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
            expect(book.entries.size).to eq(1)        
        end
    end

    describe "#import_from_csv" do
        it "imports the correct number of entries" do
            book.import_from_csv("entries.csv")
            book_size = book.entries.size

            expect(book_size).to eq 5
        end

        it "imports the 1st entry" do
            book.import_from_csv('entries.csv')
            check_entry(book.entries[0], "Bill", "555-555-4854", "bill@blocmail.com")
        end

        it "imports the 2nd entry" do
            book.import_from_csv("entries.csv")
            check_entry(book.entries[1], "Bob", "555-555-5415", "bob@blocmail.com")
        end
 
        it "imports the 3rd entry" do
            book.import_from_csv("entries.csv")
            check_entry(book.entries[2], "Joe", "555-555-3660", "joe@blocmail.com")
        end
     
        it "imports the 4th entry" do
            book.import_from_csv("entries.csv")
            check_entry(book.entries[3], "Sally", "555-555-4646", "sally@blocmail.com")
        end
     
        it "imports the 5th entry" do
            book.import_from_csv("entries.csv")
            check_entry(book.entries[4], "Sussie", "555-555-2036", "sussie@blocmail.com")
        end
    
        it "imports the correct number of entries from second csv" do
            #empty the entries array to load the second csv
            book.entries.clear
            book.import_from_csv("entries2.csv")
            expect(book.entries.size).to eq 3
        end

        it "imports 1st from 2nd csv" do
            book.import_from_csv("entries2.csv")
            check_entry(book.entries[0], "Test1", "555-555-1234", "test1@bloc.com")
        end

        it "imports 2nd from 2nd csv" do
            book.import_from_csv("entries2.csv")
            check_entry(book.entries[1], "Test2", "555-555-1235", "test2@bloc.com")
        end

        it "imports 2nd from 3rd csv" do
            book.import_from_csv("entries2.csv")
            check_entry(book.entries[2], "Test3", "555-555-1236", "test3@bloc.com")
        end
    end
end