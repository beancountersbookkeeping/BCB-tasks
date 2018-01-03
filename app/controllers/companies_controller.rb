class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find_by_id(params[:id])
    @tasks = Task.where(:company_id => @company.id)
    @user = Company.find_by_id(params[:user_id])
  end

  def new
    @users = User.all

  end

  def edit
    @company = Company.find(params[:id])
    @users = User.all
  end

  def create
    @errors = Company.save_company_errors(params, current_user)

    if @errors == "" then
      Company.save_company(params, current_user)
      flash[:notice] = "Company was successfully saved."
      redirect_to root_path
    else
      flash[:notice] = @errors
      render :action => 'new'
    end
  end

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

  def companies
    @companies_grid = initialize_grid(Company)

  end

end
