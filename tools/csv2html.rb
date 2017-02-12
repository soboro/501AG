#filename = ARGV[0]
filename = "#{Dir.pwd}/dummy.csv"
begin
    file = File.open(filename)
    file.each_line do |line|
        puts "line : #{line}"
    end

rescue => ex
    puts "[Error] : #{ex.message}"

ensure
    file.close
end 

