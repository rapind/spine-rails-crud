class DeviseCreateAdministrators < ActiveRecord::Migration
  def change
    create_table(:administrators) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable

      t.timestamps
    end

    add_index :administrators, :email,                :unique => true
    add_index :administrators, :reset_password_token, :unique => true
    # add_index :administrators, :confirmation_token,   :unique => true
    add_index :administrators, :unlock_token,         :unique => true
    add_index :administrators, :authentication_token, :unique => true
  end

end
