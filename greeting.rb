def main
    greeting = ARGV.shift
    ARGV.each do |n|
        puts "#{greeting} #{n}"
    end
end

main