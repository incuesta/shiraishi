class ArticlePolicy < ApplicationPolicy
 	

 	def index?
	    loan_officers_only
	end

	def show?
	    loan_officers_only
	end




	def create?
	    loan_officers_only
	end

	def new?
	    loan_officers_only
	end



	def update?
	    loan_officers_only
	end

	def edit?
	    loan_officers_only
	end




	def destroy?
	    loan_officers_only
	end



	def new_article_section?
		loan_officers_only
	end

	def create_article_section?
		loan_officers_only
	end



	private

		def article
			record
		end

end