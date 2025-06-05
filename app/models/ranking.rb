class Ranking < ActiveRecord::Base

  BASE_URL = "https://app.rakuten.co.jp/services/api/BooksTotal/Search/20130522"
  APPL_ID = ENV['RAKUTEN_APP_ID']
  SECRET_KEY = ENV['RAKUTEN_SECRET_KEY']

  def self.fetch
    httpClient = HTTPClient.new
    jsonData = nil
    data = httpClient.get_content(BASE_URL, {
        'applicationId' => APPL_ID,
        'booksGenreId' => '001005005006',
        'sort' => 'sales'
    })
    jsonData = JSON.parse data
    logger.debug jsonData["Items"]
    jsonData.each do |item|
      r = Ranking.new
      #r.xml = item["Item"]
      #r.save
    end
  end
end
