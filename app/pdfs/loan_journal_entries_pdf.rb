class LoanJournalEntriesPdf < Prawn::Document


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

		
		show_journal
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



	# loans data multi-dimensional array
	def dr_entries_data(dr_entries, date)
		
		dr_entries.each_with_index.map do |dr, i|
			[ (date.to_date if i == 0) || '', dr.description, @view.number_to_currency(dr.value, unit: 'Php '), '']
		end

	end


	# loans data multi-dimensional array
	def cr_entries_data(cr_entries)
		
		cr_entries.each_with_index.map do |cr|
			[ '', cr.description, '', @view.number_to_currency(cr.value, unit: 'Php ')]
		end

	end


	def show_journal
		@loans.each do |loan|
			move_down 10

			text loan.string_id, align: :center

			accounting_book = loan.accounting_book
			accounting_entries = accounting_book.accounting_entries.order("created_at asc")



			md_array = [['Date', 'Description', 'Debit', 'Credit']]
			
			accounting_entries.each do |ae|
				
				md_array += dr_entries_data(ae.dr_entries, ae.entry_date)
				md_array += cr_entries_data(ae.cr_entries)
				md_array += [['', ae.description, '', '']]
				md_array += [[{content: '', colspan: 4}]]
				
			end

			font("Helvetica", size: 8) do
				table md_array do
					row(0).font_style = :bold
					self.header = true
					self.width = 500
					self.position = :center
				end
			end

			move_down 10

		end
		# @loans End
	end
	# end show_journal


end