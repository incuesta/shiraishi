class FinancingController < ApplicationController


    layout 'public'


    def home
    end

    # get financings/articles
    def articles
        @articles = Article.order("created_at desc").paginate(page: params[:page], per_page: 5)
    end

    # get financings/1/show_article
    def show_article
        @article = Article.find(params[:id])
    end

    # get financings/featured_article
    # Really, just getting the latest
    def featured_article
        @article = Article.last

        respond_to do | format |
            format.html { render 'show_article'  }
        end
    end


    def services
        @loan_types = LoanType.paginate(page: params[:page], per_page: 6)
    end

    def organization
    end

    def about
    end

    def vision
    end

    def contacts
    end

    def help
    end


end
