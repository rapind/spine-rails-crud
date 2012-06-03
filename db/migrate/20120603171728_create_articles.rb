class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :limit => 64, :null => false
      t.text :body, :null => false

      t.timestamps
    end
  end
end