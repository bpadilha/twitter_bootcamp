class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  has_many :active_relationships, class_name: "Relationship",
                                  foreing_key: "follower_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                   foreing_key: 'followed_id'
                                   dependent: :destroy


  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower


  def following? (other_user)
    #este metodo chega se um usuário está seguindo o outro.
  end

  def follow!(other_user)
    #este método criará o relacionamento entre um usuário e outro.
  end

  def unfollow! (other_user)
    #este método apagará o relacionamento entre um usuario e outro
  end

  
end
