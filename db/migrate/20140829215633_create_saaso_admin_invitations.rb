class CreateSaasoAdminInvitations < ActiveRecord::Migration
  def change
    create_table :saaso_admin_invitations do |t|
      t.datetime :accepted_at
      t.string   :email
      t.string   :token

      t.timestamps
    end

    add_index :saaso_admin_invitations, :token, unique: true
  end
end
