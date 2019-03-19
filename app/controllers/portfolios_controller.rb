class PortfoliosController < ApplicationController
  before_action :set_portfolio_action, only: [:edit, :update, :show, :destroy]
  layout "portfolio"
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all

  def index 
    @portfolio_item = Portfolio.all
    @page_title = "Gaelen's Portfolio | Projects"
  end

  def angular
    @angular_portfolio_item = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
        
      end
    end
  end

  def edit 
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  def show
    @page_title = "Portfolio | #{@portfolio_item.title}"
  end

  def destroy 
    
    #Destroy the record
    @portfolio_item.destroy

    #Redirect 
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  private 

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end


  def set_portfolio_action
    @portfolio_item = Portfolio.find(params[:id])
  end
end
