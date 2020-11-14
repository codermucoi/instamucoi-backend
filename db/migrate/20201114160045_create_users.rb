# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, default: '', index: { unique: true }
      t.string :password_digest, null: false, default: ''
      t.datetime :token_issued_at

      t.timestamps
    end
  end
end
