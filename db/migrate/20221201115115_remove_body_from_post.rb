class RemoveBodyFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :body, :test
  end
end
