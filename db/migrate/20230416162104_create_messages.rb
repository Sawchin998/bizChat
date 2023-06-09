class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :receiver, polymorphic: true, null: false

      t.timestamps
    end
  end
end
