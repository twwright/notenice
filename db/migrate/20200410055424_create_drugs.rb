class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
		t.string :name
		t.text :side_effect
		t.integer :user_id
    end
  end
end
