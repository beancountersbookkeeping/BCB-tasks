class CompanysController < ApplicationController
  def index
    @companys = Company.all
  end

  def new
    @company = Company.new
    @company.tasks.build
  end

  def create
    @company = Company.new(params[:company])
    if @company.save
      flash[:notice] = "successfully saved"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
end
