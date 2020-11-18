class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :followed, foreign_key: {to_table: :users}
      t.references :followed_by, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
