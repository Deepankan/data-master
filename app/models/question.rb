class Question < ApplicationRecord
  self.per_page = 10

  belongs_to :mapping
  belongs_to :role

  def self.parse_csv_data(csv)
    csv.each do |row|
      role = Role.find_or_create_by(name: row['Role'])
      mapping = Mapping.find_or_create_by(name: row['Mapping'])
      Question.create(priority: row["Pri"], question: row["Question"], teaming_stage: row["Teaming Stages"], appears: row["Appears (Day)"], frequency: row["Frequency"], type_question: row["Type"], role_id: role.id, required: row["Required?"], condition: row["Conditions"], mapping_id: mapping.id )
    end
  end
end
