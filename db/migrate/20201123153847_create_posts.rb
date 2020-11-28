class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, default: ""
      t.text :body
      t.boolean :published, default: false
      t.belongs_to :member

      t.timestamps
    end
  end
end
