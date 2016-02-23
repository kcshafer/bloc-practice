require_relative '../models/address_book'

RSpec.describe AddressBook do 
    
    describe "attributes" do
        it "responds to entries" do 
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end

        it "initializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end

        it "initializes entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
 
            expect(book.entries.size).to eq(1)        
        end
    end

    describe "#remove_entry" do
        it "removes specified entry from the address book" do
            book = AddressBook.new
            book.add_entry('KC Shafer', '315-489-8569', 'kclshafer@gmail.com')

            expect(book.entries.size).to eq(1)

            book.remove_entry('KC Shafer', '315-489-8569', 'kclshafer@gmail.com')

            expect(book.entries.size).to eq(0)
        end
    end
end