class FixLoanTypeLoanDocClientDocAttrNames < ActiveRecord::Migration[5.1]
  def change
  		rename_column :loan_types, :loan_type_name, :name
  		rename_column :loan_docs, :loan_doc_name, :name
  		rename_column :client_docs, :client_doc_name, :name
  end
end
