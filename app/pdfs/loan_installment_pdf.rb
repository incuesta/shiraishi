class LoanInstallmentPdf < Prawn::Document

	def initialize(loan_installment, view_context, issued_by = "ACGECCO")
		super()

		@loan_installment = loan_installment
		@loan = @loan_installment.loan_installment_container.loan
		@view = view_context	# Pass the view_context to be able to use View Helper methods
		@issued_by = issued_by

		# title_block

		show_receipt
		
	end



	def show_receipt
		define_grid columns: 9, rows: 42, gutter: 5


		# Mother grid
		grid([0,0], [18,8]).bounding_box do

				grid([0,0], [4,8]).bounding_box() do

					image "#{Rails.root}/app/assets/images/report_header.png", height: 75, position: :center
				end



				# Title
				grid([5,0], [6,8]).bounding_box() do

					text "Payment receipt for #{@loan.string_id}", style: :bold, align: :center
				end


				y_pos = 7
				x_pos1 = 2
				x_pos2 = x_pos1 + 2




				# Interest
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Issued on", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @loan_installment.updated_at.to_date.to_s
				end





				y_pos += 1

				# installment_no
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Loan Installment no.", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @loan_installment.installment_no.to_s
				end





				y_pos += 1

				# client
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Client", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @loan.client.full_name
				end





				y_pos += 1

				# From
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "From", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @loan_installment.from.to_date.to_s
				end





				y_pos += 1

				# To
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "To", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @loan_installment.to.to_date.to_s
				end





				y_pos += 1

				# Principal
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Principal", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @view.number_to_currency(@loan_installment.principal_amount, unit: "Php ")
				end





				y_pos += 1

				# Interest
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Interest", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @view.number_to_currency(@loan_installment.interest_amount, unit: "Php ")
				end





				y_pos += 1

				# Interest
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Total", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @view.number_to_currency(@loan_installment.emi_installment, unit: "Php ")
				end




				y_pos += 2

				# Issued by
				grid([y_pos,x_pos1], [y_pos,x_pos2]).bounding_box() do
					text "Issued by", style: :bold
				end

				grid([y_pos,5], [y_pos,7]).bounding_box() do
					text @issued_by
				end



				# grid.show_all
				stroke_bounds

		end
		# Mother grid End
	end
	# show receipt end
end