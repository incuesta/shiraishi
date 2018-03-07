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


    	# Return a Link
		link_to "#{title} <span class='#{icon}'></span>".html_safe, sort_column: column, sort_order: direction
	end
end
