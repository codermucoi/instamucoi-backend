class CreateBlacklistedTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklisted_tokens do |t|
      t.string :token, null: false
      t.references :user, null: false, foreign_key: true
      t.datetime :expire_at, null: false

      t.timestamps
    end
  end
end
