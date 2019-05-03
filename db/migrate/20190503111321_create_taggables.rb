class CreateTaggables < ActiveRecord::Migration[5.1]
  def change
    create_table :taggables do |t|
      t.belongs_to :gossip, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
