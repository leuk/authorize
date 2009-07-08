class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.date :s_publish
      t.date :e_publish
      t.string :page_title
      t.string :keywords
      t.string :meta
      t.boolean :status , :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :articles
  end
end
