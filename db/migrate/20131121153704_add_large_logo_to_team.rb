class AddLargeLogoToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :large_img_url, :string
  end
end
