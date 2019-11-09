class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  belongs_to :role
  has_many :dog
  has_many :dog_walking

  validates :name, presence: true
  validates :role, presence: true

  def jwt_payload
    role = User.find_by_id(self.id).role['name']
    name = User.find_by_id(self.id)['name']
    {
      name: name,
      role: role
    }
  end
end
