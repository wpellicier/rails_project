class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer :buck_id
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :team_id
      t.string :password
      t.string :password_confirmation
      t.timestamps
    end
  end
end
