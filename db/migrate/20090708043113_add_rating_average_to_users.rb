class AddRatingAverageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :rating_average, :decimal , :default => 0
  end

  def self.down
    remove_column :users, :rating_average
  end
end
