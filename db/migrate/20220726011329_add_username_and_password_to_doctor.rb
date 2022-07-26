# frozen_string_literal: true

# To handle authentication, username and password are required
class AddUsernameAndPasswordToDoctor < ActiveRecord::Migration[7.0]
  def change
    change_table :doctors, bulk: true do |t|
      t.string :username, index: { unique: true }
      t.string :password_digest
    end
  end
end
