require 'httparty'

class Tag < ActiveRecord::Base
  include HTTParty
  default_scope { order('created_at ASC') }

  validates :tagid, presence: true, uniqueness: true
  
  serialize :calytag

=begin
  def tak(tak)
    begin
      tag = tak[:title]
      url = "http://a.wykop.pl/tag/index/#{tag},appkey,#{ENV["WYKOP_KEY_APP"]}"
      res = HTTParty.get(url, :headers => { 'apisign' => loguj(url) })
      tags = res.parsed_response['items']
      @one_tag = tags.sample
      return if !@one_tag["embed"]
      otaguj
    rescue
      false
    end 
  end
=end


  def losowy_tag
    response = HTTParty.get('https://api.imgur.com/3/g/SIa9C', :headers => { 'Authorization' => "Client-ID #{ENV["IMGUR_CLIENT_ID"]}" })
    tags = response["data"]["items"]
    @one_tag = tags.sample
    otaguj
  end

  
  private

    def otaguj
      self.tagid = @one_tag["id"]
      self.author = @one_tag["account_url"]
      self.calytag = @one_tag
      self.title = @one_tag["title"]
      self.description = @one_tag["description"]
      self.url = @one_tag["url"]
      self.source_url = @one_tag["source_url"]
      self.embedurl = @one_tag["type"]
      self.foto = @one_tag["link"]
    end
end
