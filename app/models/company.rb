class Company < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def self.save_company_errors(params, current_user)
    @errors = ""
    @name = params["company"]["name"]
    if current_user == nil then @errors += "No logged in user."
    elsif @name == "" then @errors += "Company name is empty."
    end
    return @errors
  end

  def self.save_company(params, user_id)
    @company = Company.new
    @company.name = params["company"]["name"]
    @company.user = user_id
    @company.save
  end


end
