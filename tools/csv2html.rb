require 'csv'

#filename = ARGV[0]
filename = "#{Dir.pwd}/dummy.csv"
begin
    csv_data = CSV.table(filename)
    puts "[info] start reading CSV file."
    p
    puts "headers : #{csv_data.headers}"
    p
    csv_data.each do |data|
        print "data : "
        p data
        p
    end
rescue => ex
    puts "[Error] : #{ex.message}"

ensure

end 

