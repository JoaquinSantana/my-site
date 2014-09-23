require 'httparty'

class Tag < ActiveRecord::Base
	include HTTParty

  def tak(tak)
    tag = tak[:title]
    url = "http://a.wykop.pl/tag/index/#{tag},appkey,#{ENV["WYKOP_KEY_APP"]}"
    res = HTTParty.get(url, :headers => { 'apisign' => loguj(url) })
    tags = res.parsed_response['items']
    @one_tag = tags.sample
    otaguj
  end

  
  private

    def otaguj
      self.title = @one_tag["title"] if @one_tag["title"]
      self.description = @one_tag["description"] if @one_tag["description"]
      self.body = @one_tag["body"] if @one_tag["body"]
      self.url = @one_tag["url"] if @one_tag["url"]
      self.source_url = @one_tag["source_url"] if @one_tag["source_url"]
      self.foto = @one_tag["embed"]["source"] if @one_tag["embed"]
      self.preview = @one_tag["embed"]["preview"] if @one_tag["embed"]
    end

    def loguj(url)
      Digest::MD5.hexdigest(ENV["SECRET_WYKOP_API_KEY"] + url)
    end
end
