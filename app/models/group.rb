class Group < ActiveRecord::Base
  validates :title, presence: true
  
  has_many :posts
  belongs_to :owner, class_name: "User", foreign_key: :user_id
  # 這裏的 :owner 其實等同於 :user, 可以任意命名，不管怎樣命名都會對應到 User 這個 Model
end
