module ApplicationHelper

	def render_errors_for(object)
		render partial: "application/errors", local: {object: object}
	end
end
