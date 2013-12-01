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
    elsif (due_date <= 3.months.from_now) && (due_date > 1.month.from_now)
      9
    elsif (due_date <= 6.months.from_now) && (due_date > 3.months.from_now)
      6
    elsif (due_date <= 9.months.from_now) && (due_date > 6.months.from_now)
      3
    elsif (due_date <= 10.months.from_now) && (due_date > 9.months.from_now)
      2
    elsif (due_date <= 1.year.from_now) && (due_date > 10.months.from_now)
      1
    elsif (due_date > 1.year.from_now)
      0
    end
  end

end
