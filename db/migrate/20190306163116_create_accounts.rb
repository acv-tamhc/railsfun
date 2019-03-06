class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.belongs_to :supplier
      t.string :account_number, null: false

      t.timestamps
    end
  end
end
