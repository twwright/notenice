class CreateSideEffects < ActiveRecord::Migration
  def change
	create_table :side_effects do |t|
		t.string :title
		t.text :description
		t.integer :user_id
		t.integer :drug_id
	end
  end
end
