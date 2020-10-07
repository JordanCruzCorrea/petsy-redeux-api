class ChangeImage1ToString < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :image1, :string
  end
end
