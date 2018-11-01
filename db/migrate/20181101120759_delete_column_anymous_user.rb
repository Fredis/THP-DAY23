class DeleteColumnAnymousUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :gossips, :anonymous_gossipeur
  end
end
