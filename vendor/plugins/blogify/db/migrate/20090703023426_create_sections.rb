class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :title
      t.string :keywords
      t.string :meta
      t.text :content
      t.boolean :status , :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
