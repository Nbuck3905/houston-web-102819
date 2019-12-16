class CreateItem < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image_url
      t.integer :character_id
    end
  end
end
