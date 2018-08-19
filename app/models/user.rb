class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id", dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: 'followed_id', dependent: :destroy


  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower


  def following? (other_user)
    #este metodo chega se um usuário está seguindo o outro.
    following.include? other_user
  end

  def follow!(other_user)
    #este método criará o relacionamento entre um usuário e outro.
    active_relationships.create(followed: other_user)
    #following << other_user
  end

  def unfollow! (other_user)
    #este método apagará o relacionamento entre um usuario e outro
    following.destroy other_user
  end


end
