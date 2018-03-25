class LoanPoliciesPdf < Prawn::Document

	def initialize(loan_types, view_context, issued_by = "ACGECCO", title = "", action_name)
		super()

		@loan_types = loan_types
		@view = view_context	# Pass the view_context to be able to use View Helper methods
		@issued_by = issued_by
		@title = title
		@action_name = action_name

		font "Helvetica"

		header_image

		report_title
		report_issuer

		loan_types_table
	end


	def header_image
		image "#{Rails.root}/app/assets/images/report_header.png", height: 75, position: :center
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


	def loan_types_table
		move_down 10

		loan_types_data = get_loan_types_data

		font("Helvetica", size: 8) do
			table loan_types_data, position: :center do
				row(0).font_style = :bold
				self.row_colors = ['DDDDDD', 'FFFFFF']
				self.header = true

			end
		end
	end



	def get_loan_types_data
		[['Name', 'Interest Mode', 'Rate', 'Repayment Method', 'Duration', 'Minimum', 'Maximum']] +
		@loan_types.map { |loan_type| [loan_type.name, loan_type.interest_mode, @view.number_to_percentage(loan_type.rate*100, precision: 0),  loan_type.repayment_method, "#{loan_type.duration} mos.", @view.number_to_currency(loan_type.minimum, unit: 'Php '), @view.number_to_currency(loan_type.maximum, unit: 'Php ') ] }
	end


end
