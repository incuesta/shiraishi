module ApplicationHelper

	def render_errors_for(object)
		render partial: "application/errors", locals: {shiraishi: object}
	end


	def sortable_link(title, column)
		
		title ||= column.titleize

		direction = column == sort_column_param && sort_order_param == 'desc' ? 'asc' : 'desc'


		# Bootstrap Icon
		icon = direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    	icon = column == sort_column_param ? icon : ""


    	# Add existing Parameters
    	additional_url_params = ({controller_name => {search: search_param}} if search_param) || Hash.new
    	

    	# Return a Link
		link_to "#{title} <span class='#{icon}'></span>".html_safe, {controller: controller_name, action: action_name, sort_column: column, sort_order: direction}.merge(additional_url_params)
	end


	# True if they are Authorized
	def loan_officers?
		!!current_admin || !!current_loan_manager || !!current_accountant
	end
end
