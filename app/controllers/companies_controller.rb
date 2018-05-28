class CompaniesController < ApplicationController

  before_action :authenticate_user!
  before_action :require_admin

  private

  def require_admin
    #puts "Current user: " + current_user.role.to_s
    if current_user.role.to_s != "admin" then
      flash[:notice] = "Admin required to view companies."
      redirect_to root_path
    end
  end

  public

  def index
    @companies = Company.all
  end


  def companies
    @companies_grid = initialize_grid(Company)

 def update
   @errors = Company.update_company_errors(params)
   if @errors == "" then
     Company.update_company(params)
     flash[:notice] = "Company was successfully updated."
     redirect_to companies_path
   else
     flash[:error] = @errors
     redirect_to :back
   end
  end

def destroy
  @company = Company.find(params[:id])
  if @company != nil then
    Company.destroy_company(@company)
    flash[:notice] = "Company and all of its tasks have been destroyed."
    redirect_to companies_path
  else
    flash[:notice] = "No such company"
    redirect_to :back
  end

end
