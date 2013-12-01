class PriorityCalculator
  attr_accessor :task
  attr_reader :due_date

  def initialize(task)
    @task = task
    @due_date = task.due_date
  end

  def calculate
    if @task.status == 0
      0
    else
      due_date_to_points
    end
  end

  private
  def due_date_to_points
    return 0 if due_date.nil?
    return 50 if due_date.past?

    if (due_date <= 1.week.from_now) && (due_date >= Date.today)
      25
    elsif (due_date <= 1.month.from_now) && (due_date > 1.week.from_now)
      12
    end
  end

end
