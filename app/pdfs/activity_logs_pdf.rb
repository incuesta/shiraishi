# 2018-04-21

# Title:
# 	Online Lending and Loan Management with Accounting and Decision Support System for Antipolo City Government Employees Credit Cooperative

# Author: 
# 	Leopoldo Deogenes P. Cuesta II
# 	BS-IT Student
# 	AMA Computer University, College of East Rizal


class ActivityLogsPdf < Prawn::Document

	def initialize(activity_logs, view_context, issued_by = "ACGECCO", title)
		super()

		@logs = activity_logs
		@view = view_context	# Pass the view_context to be able to use View Helper methods
		@issued_by = issued_by
		@title = title


		header_image

		report_title

		report_issuer

		logs_table
		
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



	def logs_table
		move_down 10

		font("Helvetica", size: 8) do
			table logs_data, position: :center do
				row(0).font_style = :bold
				self.row_colors = ['DDDDDD', 'FFFFFF']
				self.header = true

			end
		end
	end


	# loans data multi-dimensional array
	def logs_data
		[["User class", "User name", "Email", "Last name", "First name", "Last sign in", "Current sign in IP", "Last sign in IP", "Activty"]] +
		@logs.map { | log | 
			[log.user_class, log.user_name, log.email, log.last_name, log.first_name, log.last_sign_in_at.strftime("%Y-%m-%d %H:%M:%S"), log.current_sign_in_ip.to_s, log.last_sign_in_ip.to_s, log.note] 
		}
	end

end