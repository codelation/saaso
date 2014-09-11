class CreateSassoOrganizationMemberships < ActiveRecord::Migration
  def change
    create_table :saaso_organization_memberships do |t|
      t.integer :organization_id, index: true
      t.integer :user_id, index: true
      t.integer :organization_role_id, index: true

      t.timestamps
    end
  end
end
