class CreateSaasoOrganizationsUsers < ActiveRecord::Migration
  def change
    create_table :saaso_organizations_users do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true
    end
  end
end
