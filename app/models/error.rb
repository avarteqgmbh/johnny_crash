class Error < ActiveRecord::Base
  attr_accessible :payload
  
  default_scope order('created_at DESC')
  
  def parsed_payload
    begin
      @parsed_payload ||= JSON.parse(self.payload)
    rescue
    end
  end
  
  def parsed_custom_data
    return @parsed_custom_data if @parsed_custom_data
    @parsed_custom_data = {}
    json = parsed_payload
    if json
      custom_data = json["CUSTOM_DATA"]
      custom_data.lines.each do |line|
        mdata = /([A-Z]+) = (.*)/.match(line)
        next unless mdata
        @parsed_custom_data[mdata[1]] = mdata[2]
      end
    end
    @parsed_custom_data
  end
end
