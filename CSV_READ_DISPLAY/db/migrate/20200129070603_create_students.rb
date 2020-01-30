class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :rollno
      t.string :name
      t.text :address
      t.integer :marks

      t.timestamps
    end
  end
end
