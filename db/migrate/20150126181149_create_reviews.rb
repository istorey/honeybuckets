class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :body
      t.string :image_url
      t.references :user
      t.references :location
    end
  end
end
