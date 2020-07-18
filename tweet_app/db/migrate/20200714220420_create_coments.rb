class CreateComents < ActiveRecord::Migration[5.1]
  def change
    create_table :coments do |t|
      t.text :content
      t.references :micropost, foreign_key: true

      t.timestamps
    end
    add_index :coments, [:micropost_id, :created_at]
  end
end
