class ClientsListPdf < Prawn::Document

	def initialize(clients, view_context, issued_by = "ACGECCO", title = "", action_name)
		super()

		@clients = clients
		@view = view_context	# Pass the view_context to be able to use View Helper methods
		@issued_by = issued_by
		@title = title
		@action_name = action_name

		font "Helvetica"

		header_image

		report_title
		report_issuer

		clients_table
	end


	def header_image
		image "#{Rails.root}/app/pdfs/pdf_banner.jpg", height: 75, position: :center
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


	def clients_table
		move_down 10

		clients_data = get_clients_data

		font("Helvetica", size: 8) do
			table clients_data, position: :center do
				row(0).font_style = :bold
				self.row_colors = ['DDDDDD', 'FFFFFF']
				self.header = true

			end
		end
	end



	def get_clients_data
		[['Handle Name', 'Email', 'Last Name', 'First Name', 'Middle Name', 'Joined At']] +
		@clients.map { |client| [client.user_name, client.email, client.last_name, client.first_name, client.middle_name, client.created_at.to_date] }
	end


end
