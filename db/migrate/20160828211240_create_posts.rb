class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :idea
      t.references :user, index: true

      t.timestamps
    end
  end
end
