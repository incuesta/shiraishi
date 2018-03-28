class FinancingController < ApplicationController


    layout 'public'


    def home
        @articles = Article.order("position asc").limit(3)
    end

    # get financings/articles
    def articles
        @articles = Article.order("position asc").paginate(page: params[:page], per_page: 5)
    end

    # get financings/1/show_article
    def show_article
        @article = Article.find(params[:id])
    end

    # get financings/featured_article
    # Really, just getting the latest
    def featured_article
        @article = Article.find_by_position 1

        respond_to do | format |
            if @article
                format.html { render 'show_article'  }
            else
                format.html { redirect_to home_financing_index_path, notice: 'No articles' }
            end
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
