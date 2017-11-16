class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :companys

  after_initialize { self.role ||= :standard }

  enum role: [:standard, :admin]

  def self.convert_id_to_email(id)
    @email = "No email found"
    @user = User.find_by_id(id)
    if @user != nil then 
      @email = @user.email
    end
    return @email
  end



end
