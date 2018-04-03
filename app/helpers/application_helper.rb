module ApplicationHelper

	def render_errors_for(object)
		render partial: "application/errors", locals: {shiraishi: object}
	end


	# render profile image for users
	def render_profile_image_for(user, dark_default = false)

        render partial: 'layouts/profile_image', locals: {user: user, dark_default: dark_default}
	end


	# 1 Comment only
	def render_comment_for(comment)
		render partial: "comments/comment", locals: {comment: comment}
	end

	# All Comments
	def render_comments_for(comments)
		render partial: "comments/comments", locals: {comments: comments}
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
