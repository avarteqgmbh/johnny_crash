class Error < ActiveRecord::Base
  attr_accessible :payload
  
  default_scope order('created_at DESC')
  
  def parsed_payload
    @parsed_payload ||= JSON.parse(self.payload)
  end
  
  def parsed_custom_data
    return @parsed_custom_data if @pared_custom_data
    @parsed_custom_data = {}
    json = parsed_payload
    custom_data = json["CUSTOM_DATA"]
    custom_data.lines.each do |line|
      mdata = /([A-Z]+) = (.*)/.match(line)
      next unless mdata
      @parsed_custom_data[mdata[1]] = mdata[2]
    end
    @parsed_custom_data
  end
end
