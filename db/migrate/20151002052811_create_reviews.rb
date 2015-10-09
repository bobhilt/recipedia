class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :recipe_id, :chef_id
      t.text :summary
      t.text :description
      t.timestamps
    end
  end
end
