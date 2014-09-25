require 'httparty'

class Tag < ActiveRecord::Base
	include HTTParty

  validates :tagid, presence: true, uniqueness: true
  
  serialize :calytag

  def tak(tak)
    tag = tak[:title]
    url = "http://a.wykop.pl/tag/index/#{tag},appkey,#{ENV["WYKOP_KEY_APP"]}"
    res = HTTParty.get(url, :headers => { 'apisign' => loguj(url) })
    tags = res.parsed_response['items']
    @one_tag = tags.sample
    return if !@one_tag["embed"]
    otaguj
  end

  
  private

    def otaguj
      self.calytag = @one_tag
      self.wykoptag_id = @one_tag["id"]
      self.title = @one_tag["title"]
      self.description = @one_tag["description"]
      self.body = @one_tag["body"]
      self.url = @one_tag["url"]
      self.source_url = @one_tag["source_url"]
      self.foto = @one_tag["embed"]["source"] if @one_tag["embed"]
      self.preview = @one_tag["embed"]["preview"] if @one_tag["embed"]
    end

    def loguj(url)
      Digest::MD5.hexdigest(ENV["SECRET_WYKOP_API_KEY"] + url)
    end
end
