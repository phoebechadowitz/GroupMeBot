class CreateRecievers < ActiveRecord::Migration[7.1]
  def change
    create_table :recievers do |t|

      t.timestamps
    end
  end
end
