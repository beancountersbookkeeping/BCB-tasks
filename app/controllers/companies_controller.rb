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
   @company = Company.find(params[:id])

   if @company.save
     flash[:notice] = "Saved"
     redirect_to root_path
   else
     flash[:notice] = "Error"
     redirect_to root_path
  end
end

def destroy
  @company = Company.find(params[:id])

  if @company.destroy
    flash[:notice] = "Saved"
    redirect_to root_path
  else
    flash[:notice] = "Error"
    redirect_to root_path
  end
end

end
