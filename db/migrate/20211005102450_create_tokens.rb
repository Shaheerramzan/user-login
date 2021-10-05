class CreateTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :tokens do |t|
      t.string :token
      t.integer :user_id
      t.index :token

      t.timestamps
    end
  end
end
