class Workshop < ActiveRecord::Base

  def self.get_events
    Workshop.search_data
  end

  def self.search_data
    conn = Faraday.new(:url => 'https://www.eventbriteapi.com/v3/') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    response = conn.get 'events/search/', { :popular => 'yes', :q => 'workshop',:sort_by => 'best', 'location.address' => 'California', :categories => 102, :token => "M55UU6OIXPE27JH2RGCX"}
    self.build_from_response(JSON.parse(response.body))
  end

  def self.build_from_response(response)
    new_events = []
    response['events'].each do |i|
      new_events << Workshop.new(title: i["name"]["text"],
        description: i['description']["text"],
        startdate: i['start']['utc'],
        enddate: i['end']['utc'],
        eventUrl: i['url'],
        status: i['status'],
        imageSource: i['logo'].nil? ? nil : i['logo']['url'])
    end
    new_events
  end
end
