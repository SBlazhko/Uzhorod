class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts, id: false do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end
end
