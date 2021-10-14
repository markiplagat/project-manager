# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user

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

  def status
    return 'not-started' if task.none?

    if tasks.all?(&:complete?)
      'complete'
    elsif task.any?(&:in_progress?)
      'in-progress'
    else
      'not-started'
    end
  end
end
