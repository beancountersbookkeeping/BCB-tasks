class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new
    if @company.save
      flash[:notice] = "successfully saved"
      redirect_to root_path
    else
      flash[:notice] = "error"
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
