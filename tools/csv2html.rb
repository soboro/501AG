# -- sample ---
#        --flag_de:"https://static.wixstatic.com/media/1eae9a_25a3791b295c42fda5a5a12b617f4923~mv2.png";
#        --flag_su:"https://static.wixstatic.com/media/1eae9a_2bf2fadcad624ae0ba0b4d170533ac85~mv2.png";
#        --flag_us:"https://static.wixstatic.com/media/1eae9a_6316e8982ea9487a811e8fa21d2c7146~mv2.png";
#        --flag_jp:"https://static.wixstatic.com/media/1eae9a_c8c64785e1384fb7862c1a29b38a5ef0~mv2.png";
#        --flag_cn:"https://static.wixstatic.com/media/1eae9a_de77a92d9e314c19a22047f590302820~mv2.png";
#        --flag_gb:"https://static.wixstatic.com/media/1eae9a_8b8e121ef13946f6a5431fb73fe3c500~mv2.png";
#        --flag_fr:"https://static.wixstatic.com/media/1eae9a_5d41aabd031c490b8b0b526e96661213~mv2.png";
#        --flag_cz:"https://static.wixstatic.com/media/1eae9a_c6c7426a36744b37ad42b0f2bfd61c10~mv2.png";
#        --flag_se:"https://static.wixstatic.com/media/1eae9a_2291473f297541c09ea9f811a2326cfd~mv2.png";
#        
#        --icon-lt:"https://static.wixstatic.com/media/1eae9a_f5831ad5e71847a1b1871d2c089e3252~mv2.png";
#        --icon-mt:"https://static.wixstatic.com/media/1eae9a_135cf9081f454905bb74bc3e82b684ee~mv2.png";
#        --icon-ht:"https://static.wixstatic.com/media/1eae9a_12e817c76f704caa98f6d61521c0182b~mv2.png";
#        --icon-td:"https://static.wixstatic.com/media/1eae9a_dc1f62b383514d489c12b58e8ec68481~mv2.png";
#        --icon-spg:"https://static.wixstatic.com/media/1eae9a_c459211fa515474fb164239436d7b0cd~mv2.png";
#
#        --playbutton:"https://static.wixstatic.com/media/1eae9a_36fe888fd8d442d78da0958b4e6c41d5~mv2.png";
#
#--template
#        <tr class="datarow">
#            <td class="country"><img src="" alt=""></td>
#            <td class="vehicletype"><img src="" alt=""></td>
#            <td class="vehiclename"></td>
#            <td class="map"></td>
#            <td class="exp"></td>
#            <td class="instructor">教官</td>
#            <td class="playbutton"><a href="" target="_blank"><img src="https://static.wixstatic.com/media/1eae9a_36fe888fd8d442d78da0958b4e6c41d5~mv2.png" alt=""></a></td>
#            <td class="update"></td>
#        </tr>
#        <tr class="sepalatorrow">
#        </tr>
#-->

HTML_TAG_A = "a"
HTML_TAG_IMG = "img"
def double_quater(str)
    return "\"" << str << "\""
end

def html_tagger(string:, tag:, class:, link:, target:, src:, alt:)

    pretag = ""
    suftag = ""
    dest_str = ""

    if tag == HTML_TAG_A then
        pretag = HTML_TAG_A << " href=" << double_quater(link) << " target=" << double_quater(target)
    end

    if tag == HTML_TAG_IMG then
        pretag = HTML_TAG_IMG << " src =" << double_quater(src) << " alt=" << double_quater(alt)
    end
    pretag_str = "<" << tag << ">"
    suftag_str = "</" << tag << ">"
    dest_str = pretag_str << str << suftag_str
    return dest_str
end

require 'csv'

flag_urls = Hash.new
flag_urls["DE"] = "https://static.wixstatic.com/media/1eae9a_25a3791b295c42fda5a5a12b617f4923~mv2.png";
flag_urls["SU"] = "https://static.wixstatic.com/media/1eae9a_2bf2fadcad624ae0ba0b4d170533ac85~mv2.png";
flag_urls["US"] = "https://static.wixstatic.com/media/1eae9a_6316e8982ea9487a811e8fa21d2c7146~mv2.png";
flag_urls["JP"] = "https://static.wixstatic.com/media/1eae9a_c8c64785e1384fb7862c1a29b38a5ef0~mv2.png";
flag_urls["CN"] = "https://static.wixstatic.com/media/1eae9a_de77a92d9e314c19a22047f590302820~mv2.png";
flag_urls["GB"] = "https://static.wixstatic.com/media/1eae9a_8b8e121ef13946f6a5431fb73fe3c500~mv2.png";
flag_urls["FR"] = "https://static.wixstatic.com/media/1eae9a_5d41aabd031c490b8b0b526e96661213~mv2.png";
flag_urls["CZ"] = "https://static.wixstatic.com/media/1eae9a_c6c7426a36744b37ad42b0f2bfd61c10~mv2.png";
flag_urls["SE"] = "https://static.wixstatic.com/media/1eae9a_2291473f297541c09ea9f811a2326cfd~mv2.png";

type_icon_urls = Hash.new
type_icon_urls["LT"] = "https://static.wixstatic.com/media/1eae9a_f5831ad5e71847a1b1871d2c089e3252~mv2.png";
type_icon_urls["MT"] = "https://static.wixstatic.com/media/1eae9a_135cf9081f454905bb74bc3e82b684ee~mv2.png";
type_icon_urls["HT"] = "https://static.wixstatic.com/media/1eae9a_12e817c76f704caa98f6d61521c0182b~mv2.png";
type_icon_urls["TD"] = "https://static.wixstatic.com/media/1eae9a_dc1f62b383514d489c12b58e8ec68481~mv2.png";
type_icon_urls["SPG"] = "https://static.wixstatic.com/media/1eae9a_c459211fa515474fb164239436d7b0cd~mv2.png";

#filename = ARGV[0]
filename = "#{Dir.pwd}/dummy.csv"
begin
    csv_data = CSV.table(filename)
    puts "[info] start reading CSV file."
    p
    puts "headers : #{csv_data.headers}"
    p
    rowcount = 0
    csv_data.each do |data|
        #process for a row
        #
        print "data : "
        p data
        p
        ###



    end
rescue => ex
    puts "[Error] : #{ex.message}"

ensure
    teststr = html_tagger("test", "p")
    puts "str : #{teststr}"
end 

