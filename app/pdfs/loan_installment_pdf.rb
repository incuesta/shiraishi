class LoanInstallmentPdf < Prawn::Document

	def initialize(loan_installment, view_context)
		super()

		@loan_installment = loan_installment
		@loan = @loan_installment.loan_installment_container.loan
		@view = view_context

		# title_block

		show_receipt
		
	end


	def receipt

		bounding_box [0, cursor], width: 500, align: :center do 

			

			move_down 10

			text @loan.string_id, size: 15, align: :center

			move_down 10

			indent(10) do

				text "Loan Installment no.", style: :bold
				text @loan_installment.installment_no.to_s

				move_down 10

				text "Client", style: :bold
				text @loan.client.full_name

				
			end

			transparent(0.8) { stroke_bounds}
		end
			
	end


	def show_receipt
		define_grid columns: 9, rows: 24, gutter: 5

		#grid([0,3], [0,5]).show

		grid.show_all
	end


end