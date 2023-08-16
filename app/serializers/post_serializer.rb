class PostSerializer
  include JSONAPI::Serializer
  attributes :body, :title
end
