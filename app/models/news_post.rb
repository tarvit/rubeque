class NewsPost
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :body, :type => String
  key :title

  referenced_in :user
end
