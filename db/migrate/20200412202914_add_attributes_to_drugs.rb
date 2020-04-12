class AddAttributesToDrugs < ActiveRecord::Migration
	def change
		add_column :drugs, :dosage, :integer
		add_column :drugs, :purpose, :string
	end
end
