class CreateSassoOrganizationRoles < ActiveRecord::Migration
  def change
    create_table :saaso_organization_roles do |t|
      t.string :name
    end
  end
end
