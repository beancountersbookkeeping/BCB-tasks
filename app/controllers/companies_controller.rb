class CompaniesController < ApplicationController
  def index
    @companys = Company.all
  end

  def new
    @company = Company.new
    @company.tasks.build
    @task = Task.new
  end

  def create
    flash[:notice] = 'here'
    @company = Company.new
    if @company.save
      flash[:notice] = "successfully saved"
      redirect_to root_path
    else
      flash[:notice] = "error"
      render :action => 'new'
    end
  end
end
