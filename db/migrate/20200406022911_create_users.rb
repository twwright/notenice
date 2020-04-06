class CreateUsers < ActiveRecord::Migration
  def change
	create_table :users do |t|
		t.string :username
		t.string :name
		t.string :email
		t.datetime :birthday
		t.string :password_digest
		t.boolean :terms_of_service
	end
  end
end
