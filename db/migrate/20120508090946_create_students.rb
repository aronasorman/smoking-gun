class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :picture
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :section_id
      t.string :nickname
      t.string :address
      t.string :telno
      t.string :celno
      t.string :email
      t.date :birthdate
      t.string :birthplace
      t.text :sibling_comments
      t.text :family_concerns
      t.string :most_significant_person
      t.text :why_significant
      t.boolean :is_special_guidance_needed
      t.text :special_guidance_elaboration
      t.text :work_experience
      t.text :interests

      t.timestamps
    end
  end
end
