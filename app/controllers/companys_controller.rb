class CompanysController < ApplicationController
  def index
    @companys = Company.all
  end
end
