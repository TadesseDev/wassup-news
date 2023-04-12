class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :category
      t.string :keyword
      t.string :frequency

      t.timestamps
    end
  end
end
