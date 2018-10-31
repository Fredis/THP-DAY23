class CreateGossips < ActiveRecord::Migration[5.2]
  def change
    create_table :gossips do |t|
      t.string :anonymous_gossipeur
      t.text :content
      t.timestamps
    end
  end
end
