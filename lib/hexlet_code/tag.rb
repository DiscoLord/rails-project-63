# frozen_string_literal: true

class Tag
  def self.build(tag_name, attributes)
    content = attributes.delete(:content)
    params = attributes.map { |key, value| "#{key}='#{value}'" }.join(' ')
    if content
      "<#{tag_name} #{params}>#{content}</#{tag_name}>"
    else
      "<#{tag_name} #{params}>"
    end
  end
end
