class PagesController < ApplicationController
  def home
  end

  def services
  end

  def articles
  end

  def organization
    render layout: 'landing'
  end

  def about
  end

  def contacts
  end

  def help
  end

  def quick_start
    @videos = Video.order("position asc").paginate(page: params[:page], per_page: 8)

    render layout: 'landing' unless (current_admin || current_loan_manager || current_accountant)
  end
end
