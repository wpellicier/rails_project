class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.string :email

      t.timestamps
    end
  end
end
