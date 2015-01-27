class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :category, index: true
      t.text :text

      t.timestamps null: false
    end
    add_foreign_key :questions, :categories
  end
end
