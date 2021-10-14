# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  name        :string
#  description :text
#  status      :string
#  project_id  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: { in: ['not-started', 'in-progress', 'complete']}
  validates :name, presence: true

  STATUS_OPTIONS =[
    ['Not started', 'not-started'],
    ['In Progress', 'in-progress'],
    ['Complete', 'complete']
  ]

  def badge_color
    case status
    when 'not-started'
      'secondary'
    when 'in-progress'
      'info'
    when 'complete'
      'success'
    end
  end

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in-progress'
  end

  def not_started?
    status == 'not-started'
  end
end
