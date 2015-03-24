class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title,       null: false
      t.text    :description, null: false
      t.integer :user_id,     null: false

      t.timestamps null: false
    end
    add_index :questions, [:title, :user_id], unique: true
  end
end
