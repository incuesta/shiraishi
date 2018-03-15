class ReportsController < ApplicationController
  

	  def index
	  end

	  def show
	  end



	  # GET /reports/activity_logs
	  def activity_logs
	    @logs = ActivityLog.order("last_sign_in_at desc")
	    

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            logs_pdf = ActivityLogsPdf.new(@logs, view_context, issuer, "User Activity Logs")

	            send_data logs_pdf.render, filename: 'user_activity_logs.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end



	   # GET /reports/income_summary
	  def income_summary
	    @loans = Loan.disbursed_loans.order("disbursement_date desc")
	    

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            loans_pdf = IncomeSummaryPdf.new(@loans, view_context, issuer, "Income Summary", action_name)

	            send_data loans_pdf.render, filename: 'income_summary.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	 
	  # GET /reports/requested_loans
	  def requested_loans
	    @loans = Loan.requested_loans.order("application_date desc")
	    

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Requested loans", action_name)

	            send_data loans_pdf.render, filename: 'requested_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/approved_loans
	  def approved_loans
	   	@loans = Loan.approved_loans.order("approved_date desc")

	    
	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Approved loans", action_name)

	            send_data loans_pdf.render, filename: 'approved_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/rejected_loans
	  def rejected_loans
	    @loans = Loan.rejected_loans.order("application_date desc")

	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Rejected Loan Request", action_name)

	            send_data loans_pdf.render, filename: 'rejected_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/disbursed_loans
	  def disbursed_loans
	    @loans = Loan.disbursed_loans.order("disbursement_date desc")

	     respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Disbursed loans", action_name)

	            send_data loans_pdf.render, filename: 'disbursed_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end




	  # GET /reports/undisbursed_loans
	  def undisbursed_loans
	    @loans = Loan.undisbursed_loans.order("application_date desc")
	    
	    respond_to do | format |
	        
	        format.pdf do
	            issuer = ("#{current_accountant.last_name} #{current_accountant.first_name}" if current_accountant) || "ACGECCO"

	            loans_pdf = LoansPdf.new(@loans, view_context, issuer, "Undisbursed Loan Request", action_name)

	            send_data loans_pdf.render, filename: 'undisbursed_loans.pdf', type: 'application/pdf', disposition: 'inline'
	          
	        end
	    end
	  end


end
