class CreateDrugs < ActiveRecord::Migration
  def change
	create_table :drugs do |t|
		t.string :name
		t.integer :dosage
		t.string :dosage_unit
  end
end
