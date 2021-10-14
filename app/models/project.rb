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
