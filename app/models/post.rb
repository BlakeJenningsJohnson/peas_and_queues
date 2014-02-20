class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  acts_as_commentable

  belongs_to :user
end
