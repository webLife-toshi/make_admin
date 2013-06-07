class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
