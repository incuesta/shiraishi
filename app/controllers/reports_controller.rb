class ReportsController < ApplicationController
  

	  def index
	  	authorize :report
	  end

	  def show
	  	authorize :report
	  end



	  # GET /reports/activity_logs
	  def activity_logs
	  	authorize :report

	    @logs = ActivityLog.order("last_sign_in_at desc")
	    
	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            logs_pdf = ActivityLogsPdf.new(@logs, view_context, issuer, "User Activity Logs")

	            send_data logs_pdf.render, filename: 'user_activity_logs.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end



	   # GET /reports/income_summary
	  def income_summary
	  	authorize :report

	    @loans = Loan.disbursed_loans.order("disbursement_date desc")

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loans_pdf = IncomeSummaryPdf.new(@loans, view_context, issuer, "Income Summary", action_name)

	            send_data loans_pdf.render, filename: 'income_summary.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	 
	  # GET /reports/requested_loans
	  def requested_loans
	  	authorize :report

	    @loans = Loan.requested_loans.order("application_date desc")
	    

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Requested loans", action_name)

	            send_data loans_pdf.render, filename: 'requested_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/approved_loans
	  def approved_loans
	  	authorize :report

	   	@loans = Loan.approved_loans.order("approved_date desc")

	    
	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Approved loans", action_name)

	            send_data loans_pdf.render, filename: 'approved_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/rejected_loans
	  def rejected_loans
	  	authorize :report

	    @loans = Loan.rejected_loans.order("application_date desc")

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Rejected Loan Request", action_name)

	            send_data loans_pdf.render, filename: 'rejected_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/disbursed_loans
	  def disbursed_loans
	  	authorize :report

	    @loans = Loan.disbursed_loans.order("disbursement_date desc")

	     respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Disbursed loans", action_name)

	            send_data loans_pdf.render, filename: 'disbursed_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/undisbursed_loans
	  def undisbursed_loans
	  	authorize :report

	    @loans = Loan.undisbursed_loans.order("application_date desc")
	    
	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Undisbursed Loan Request", action_name)

	            send_data loans_pdf.render, filename: 'undisbursed_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end


	  # GET /reports/clients_list
	  def clients_list
	  	#authorize :report

	    @clients = Client.order("created_at desc")
	    
	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            clients_pdf = ClientsListPdf.new(@clients, view_context, issuer, "Members List", action_name)

	            send_data clients_pdf.render, filename: 'clients_list.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end


	  def loan_types_list
	  	@loan_types = LoanType.all

	  	respond_to do |format|
	  		format.pdf do
	  			issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loan_types_pdf = LoanTypesPdf.new(@loan_types, view_context, issuer, "List of Loan Services", action_name)

	            send_data loan_types_pdf.render, filename: 'loan_services.pdf', type: 'application/pdf', disposition: 'inline'
	          
	  		end
	  	end
	  end


	  def loan_policies_list
	  	@loan_types = LoanType.all

	  	respond_to do |format|
	  		format.pdf do
	  			issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loan_policies_pdf = LoanPoliciesPdf.new(@loan_types, view_context, issuer, "Policies for Loans", action_name)

	            send_data loan_policies_pdf.render, filename: 'loan_policies.pdf', type: 'application/pdf', disposition: 'inline'
	          
	  		end
	  	end
	  end


	  def loan_journal_entries
	  	@loans = Loan.disbursed_loans

	  	respond_to do |format|
	  		format.pdf do
	  			issuer = ("#{pundit_user.last_name} #{pundit_user.first_name}" if pundit_user) || "ACGECCO"

	            loan_journal_entries_pdf = LoanJournalEntriesPdf.new(@loans, view_context, issuer, "Loan Installments", action_name)

	            send_data loan_journal_entries_pdf.render, filename: 'loan_installments.pdf', type: 'application/pdf', disposition: 'inline'
	          
	  		end
	  	end
	  end


end
