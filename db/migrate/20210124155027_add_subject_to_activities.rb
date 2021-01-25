class AddSubjectToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :subject, polymorphic: true, index: true
  end
end
