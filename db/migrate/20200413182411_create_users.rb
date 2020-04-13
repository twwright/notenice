class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :username
        t.string :name 
        t.text :profile
        t.string :password_digest
        t.boolean :terms_of_service
  end
end
