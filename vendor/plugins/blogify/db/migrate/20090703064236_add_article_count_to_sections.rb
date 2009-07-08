class AddArticleCountToSections < ActiveRecord::Migration
  def self.up
  	add_column :sections , :articles_count , :integer , :default => 0
  	remove_column :sections , :content
  end

  def self.down
  	remove_column :sections , :articles_count
  	add_column :sections , :content , :text
  end
end
