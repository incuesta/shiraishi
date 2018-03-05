class AddSomeForeinKeyToSubmittedDocs < ActiveRecord::Migration[5.1]
  def change
  		add_reference :submitted_docs, :loan_doc, foreign_key: true, after: :loan_id
  end
end
