class DrEntriesController < ApplicationController

	before_action :set_dr_entry, only: [:edit, :update]


	# GET /dr_entries/1/edit
	def edit

	end


	# PATCH /dr_entries/1
	def update

		respond_to do | format |
			if @dr_entry.update(dr_entry_params)
				format.html { redirect_to edit_accounting_entry_path(@dr_entry.accounting_entry), notice: 'Debit updated' }
			else
				format.html { render 'edit', notice: 'Cannot update Debit' }
			end

		end

	end


	private
		def set_dr_entry
			@dr_entry = DrEntry.find(params[:id])
		end

		def dr_entry_params
			params.require(:dr_entry).permit(:description, :value)
		end
end