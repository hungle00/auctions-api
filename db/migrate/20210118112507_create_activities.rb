class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :direction
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
