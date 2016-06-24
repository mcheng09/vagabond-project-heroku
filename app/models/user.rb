class User < ActiveRecord::Base

  has_many :posts
  has_secure_password

  has_attached_file :avatar, styles: { large: "400x400>", medium: "300x300>", thumb: "100x100>" }, default_url: "Ben.jpeg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /@/}

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end


end
