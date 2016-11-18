class CreateAddCategoryIdToPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :add_category_id_to_posts do |t|
    	add_column :posts, :category_id, :integer
      t.timestamps
    end
  end
end
