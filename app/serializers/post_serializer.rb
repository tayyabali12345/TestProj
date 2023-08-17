class PostSerializer
  include JSONAPI::Serializer
  attributes :body, :title

  attribute :about do |object|
    "#{object.title} (#{object.body})"
  end
end
