class CreateHashtagsQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_questions do |t|

      t.timestamps
    end
  end
end
