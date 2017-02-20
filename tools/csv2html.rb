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

require 'csv'

COUNTRY_DE = "DE"
COUNTRY_SU = "SU"
COUNTRY_US = "US"
COUNTRY_JP = "JP"
COUNTRY_CN = "CN"
COUNTRY_GB = "GB"
COUNTRY_FR = "FR"
COUNTRY_CZ = "CZ"
COUNTRY_SE = "SE"

TYPE_LT = "LT"
TYPE_MT = "MT"
TYPE_HT = "HT"
TYPE_TD = "TD"
TYPE_SPG = "SPG"


def double_quater(str)
    return "\"" + str + "\""
end

def tagger_tr(str, cls)
    pretag = "<tr class=" + double_quater(cls) + ">"
    suftag = "</tr>"
    dest_str = "\n" + "\t" + pretag + str + suftag

    return dest_str
end

def tagger_td(str, cls)
    pretag = "<td class=" + double_quater(cls) + ">"
    suftag = "</td>"
    dest_str = "\n" + "\t" + pretag + str + suftag

    #puts
    #puts "dest_str : #{dest_str}"
    #puts

    return dest_str
end

def tagger_a(str, rul, target)
    pretag = "<a href=" + double_quater(cls) + " target=" + double_quater(target) + ">"
    suftag = "</a>"
    dest_str = "\n" + pretag + str + suftag

    return dest_str
end

def tagger_img(str, alt)
    pretag = "<img src="
    suftag = " alt=" + double_quater(alt) + ">"
    dest_str = pretag + str + suftag

    return dest_str
end

def main()
    country_icon_urls = Hash.new
    country_icon_urls["DE"] = "https://static.wixstatic.com/media/1eae9a_25a3791b295c42fda5a5a12b617f4923~mv2.png";
    country_icon_urls["SU"] = "https://static.wixstatic.com/media/1eae9a_2bf2fadcad624ae0ba0b4d170533ac85~mv2.png";
    country_icon_urls["US"] = "https://static.wixstatic.com/media/1eae9a_6316e8982ea9487a811e8fa21d2c7146~mv2.png";
    country_icon_urls["JP"] = "https://static.wixstatic.com/media/1eae9a_c8c64785e1384fb7862c1a29b38a5ef0~mv2.png";
    country_icon_urls["CN"] = "https://static.wixstatic.com/media/1eae9a_de77a92d9e314c19a22047f590302820~mv2.png";
    country_icon_urls["GB"] = "https://static.wixstatic.com/media/1eae9a_8b8e121ef13946f6a5431fb73fe3c500~mv2.png";
    country_icon_urls["FR"] = "https://static.wixstatic.com/media/1eae9a_5d41aabd031c490b8b0b526e96661213~mv2.png";
    country_icon_urls["CZ"] = "https://static.wixstatic.com/media/1eae9a_c6c7426a36744b37ad42b0f2bfd61c10~mv2.png";
    country_icon_urls["SE"] = "https://static.wixstatic.com/media/1eae9a_2291473f297541c09ea9f811a2326cfd~mv2.png";

    type_icon_urls = Hash.new

    type_icon_urls["LT"] = "https://static.wixstatic.com/media/1eae9a_f5831ad5e71847a1b1871d2c089e3252~mv2.png";
    type_icon_urls["MT"] = "https://static.wixstatic.com/media/1eae9a_135cf9081f454905bb74bc3e82b684ee~mv2.png";
    type_icon_urls["HT"] = "https://static.wixstatic.com/media/1eae9a_12e817c76f704caa98f6d61521c0182b~mv2.png";
    type_icon_urls["TD"] = "https://static.wixstatic.com/media/1eae9a_dc1f62b383514d489c12b58e8ec68481~mv2.png";
    type_icon_urls["SPG"] = "https://static.wixstatic.com/media/1eae9a_c459211fa515474fb164239436d7b0cd~mv2.png";

        
    #filename = ARGV[0]
    filename = "#{Dir.pwd}/dummy.csv"

    begin
        puts "[info] begin throwing"

        csv_data = CSV.table(filename)
        puts "[info] start reading CSV file."
        puts
        csv_headers = csv_data.headers
        puts "headers : #{csv_headers}"
        puts

        output_code = ""
        rowcount = 1

        csv_data.each do |row|

            puts "========"

            # Tier
            data = row[:tier]
            row_code_tier = tagger_td(data.to_s, "tier")
            output_code = output_code + row_code_tier
            print output_code
            puts "\n--------"

            # Country
            data = row[:country]
            icon_url = ""
            img_code = ""

            if country_icon_urls.has_key?(data)
                icon_url = country_icon_urls[data]
                img_code = tagger_img(icon_url, "")
            elsif
                p "[Error] undefined country code detected."
            end

            row_code_country = tagger_td(img_code, "country")
            output_code = output_code + row_code_country
            print output_code
            puts "\n--------"

            # Vehicletype
            data = row[:vehicletype]
            icon_url = ""
            img_code = ""

            if type_icon_urls.has_key?(data)
                icon_url = type_icon_urls[data]
                img_code = tagger_img(icon_url, "")
            elsif
                p "[Error] undefined vehicletype code detected."
            end

            row_code_vehicletype = tagger_td(img_code, "vehicletype")
            output_code = output_code + row_code_vehicletype
            print output_code
            puts "\n--------"

            # VihicleName
            data = row[:vehiclename]
            row_code_viheclename = tagger_td(data, "vehiclename")
            output_code = output_code + row_code_viheclename
            print output_code
            puts "\n--------"

            # Map
            data = row[:map]
            row_code_map = tagger_td(data, "map")
            output_code = output_code + row_code_map
            print output_code
            puts "\n--------"

            # Exp
            data = row[:exp]
            row_code_exp = tagger_td(data.to_s, "exp")
            output_code = output_code + row_code_exp
            print output_code
            puts "\n--------"

            # Instructor
            data = row[:instructor]
            row_code_instructor = tagger_td(data, "instructor")
            output_code = output_code + row_code_instructor
            print output_code
            puts "\n--------"

            # Link
            data = row[:link]
            row_code_playbutton = tagger_td(data, "playbutton")
            output_code = output_code + row_code_playbutton
            print output_code
            puts "\n--------"

            # Date
            data = row[:update]
            row_code_update = tagger_td(data, "uptade")
            output_code = output_code + row_code_update
            print output_code
            puts "\n--------"

            puts
            puts "========"
            puts

            ###

            rowcount += 1
        end

        puts

        puts "[info] end throwing"

    rescue => ex
        puts "[info] begin rescue"

        puts "[Error] : #{ex.message}"
        puts $@

        puts "[info] end rescue"

    ensure
        puts "[info] begin ensure"

        puts "[info] end ensure"
    end 
end

main()

