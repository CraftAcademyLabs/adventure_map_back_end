class InterestParser < ActsAsTaggableOn::GenericParser
  def parse
    ActsAsTaggableOn::TagList.new.tap do |tag_list|
      @tag_list.split(', ').each do |tag|
        if User::VALID_INTERESTS.include?(tag)
          tag_list.add(tag)
        else
          raise 'You need to pick one of the preset interests'
        end
      end
    end
  end
end
