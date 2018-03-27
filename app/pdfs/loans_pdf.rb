class LoansPdf < Prawn::Document

	def initialize(loans, view_context, issued_by = "ACGECCO", title = "", action_name)
		super()

		@loans = loans
		@view = view_context	# Pass the view_context to be able to use View Helper methods
		@issued_by = issued_by
		@title = title
		@action_name = action_name

		font "Helvetica"

		header_image

		report_title
		report_issuer

		loans_table
	end


	def header_image
		image "#{Rails.root}/app/pdfs/report_header.png", height: 75, position: :center
	end



	# The title of the report
	def report_title
		move_down 10
		text @title, style: :bold, align: :center
	end


	# The User who generated the report
	def report_issuer
		move_down 5
		text "Generated by: #{@issued_by}", size: 7, align: :center
	end


	def loans_table
		move_down 10

		loans_data = get_loans_data

		font("Helvetica", size: 8) do
			table loans_data, position: :center do
				row(0).font_style = :bold
				self.row_colors = ['DDDDDD', 'FFFFFF']
				self.header = true

			end
		end
	end


	



	def get_loans_data
		case @action_name
			when "requested_loans" then requested_loans_data
			when "approved_loans" then approved_loans_data
			when "disbursed_loans" then disbursed_loans_data
			else loans_data
		end
	end




	# loans data multi-dimensional array
	def loans_data
		[["Loan", "Type", "Application date", "Applicant", "Status", "Principal amount", "Net interest"]] +
		@loans.map { | loan | [loan.string_id, loan.loan_type.name, loan.application_date.to_date, loan.client.full_name, loan.status, @view.number_to_currency(loan.principal_amount, unit: "Php "), @view.number_to_currency(loan.net_interest, unit: "Php ")] }
	end


	def requested_loans_data
		[["Loan", "Type", "Application date", "Applicant", "Principal amount", "Net interest"]] +
		@loans.map { | loan | [loan.string_id, loan.loan_type.name, loan.application_date.to_date, loan.client.full_name, @view.number_to_currency(loan.principal_amount, unit: "Php "), @view.number_to_currency(loan.net_interest, unit: "Php ")] }
	end



	def approved_loans_data
		[["Loan", "Type", "Application date", "Approved on", "Applicant", "Principal amount", "Net interest"]] +
		@loans.map { | loan | [loan.string_id, loan.loan_type.name, loan.application_date.to_date, loan.approved_date.to_date, loan.client.full_name, @view.number_to_currency(loan.principal_amount, unit: "Php "), @view.number_to_currency(loan.net_interest, unit: "Php ")] }
	end


	def disbursed_loans_data
		[["Loan", "Type", "Duration", "Application date", "Disbursed on", "Applicant", "Principal amount", "Net interest"]] +
		@loans.map { | loan | [loan.string_id, loan.loan_type.name, "#{loan.loan_type.duration} mos.", loan.disbursement_date.to_date, loan.approved_date.to_date, loan.client.full_name, @view.number_to_currency(loan.principal_amount, unit: "Php "), @view.number_to_currency(loan.net_interest, unit: "Php ")] }
	end

end
