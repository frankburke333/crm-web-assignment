class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :string
      t.string :email
      t.string :string
      t.string :notes
      t.string :text

      t.timestamps
    end
  end
end
