require 'csv'

#filename = ARGV[0]
filename = "#{Dir.pwd}/dummy.csv"
begin
    csv_data = CSV.read(filename, headers: true)
    puts "[info] start reading CSV file."
    csv_data.each do |data|
        print "data : "
        p csv_data.to_a
    end
rescue => ex
    puts "[Error] : #{ex.message}"

ensure

end 

