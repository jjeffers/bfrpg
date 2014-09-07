require "csv"
module ParseCSV
    
    def ParseCSV.parse_csv(text)

        CSV::StringReader.new(text.strip).collect[0]
        
    end
    
end
