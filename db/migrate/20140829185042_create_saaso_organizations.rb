class CreateSaasoOrganizations < ActiveRecord::Migration
  def change
    create_table :saaso_organizations do |t|
      t.belongs_to :owner, index: true

      t.string :name
      t.string :time_zone

      t.timestamps
    end
  end
end
