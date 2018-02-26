module ApplicationHelper

	def render_errors_for(object)
		render partial: "application/errors", locals: {shiraishi: object}
	end
end
