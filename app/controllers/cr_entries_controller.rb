class CrEntriesController < ApplicationController

	before_action :set_cr_entry, only: [:edit, :update]


	# GET /cr_entries/1/edit
	def edit

	end


	# PATCH /cr_entries/1
	def update

		respond_to do | format |
			if @cr_entry.update(cr_entry_params)
				format.html { redirect_to edit_accounting_entry_path(@cr_entry.accounting_entry), notice: 'Credit updated' }
			else
				format.html { render 'edit', notice: 'Cannot update Credit. T.T' }
			end

		end

	end


	private
		def set_cr_entry
			@cr_entry = CrEntry.find(params[:id])
		end

		def cr_entry_params
			params.require(:cr_entry).permit(:description, :value)
		end
end