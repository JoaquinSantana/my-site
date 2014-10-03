require 'spec_helper'

=begin
	describe Tag, :vcr => true do

		it "nie powinien zapisać tagu bez tagid wykopu" do
			tag = Tag.new
			@haszyk = {}
			@haszyk[:title] = 'earthporn' 
			tag.tak(@haszyk)

			tag.tagid = nil
			tag.save.should be_falsy
		end

		it "nie powinno zapisać tagu z identycznym tagid wykopu" do

			tag = FactoryGirl.create(:tag)

			tag2 = FactoryGirl.build(:tag)
			tag2.tak(@haszyk)
			tag2.tagid = tag.tagid
			tag2.save.should be_falsy
	end
=end

end
