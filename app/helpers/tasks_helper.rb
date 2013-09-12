module TasksHelper

  def task_due(date)
    output = ''
    if date.nil?
      output = "None"
    else
      compare = date
      now = DateTime.now.to_date
      diff = Time.diff(now, compare)

      if date == Date.tomorrow
        output = 'Tomorrow'
      elsif date == Date.yesterday
        output = 'Yesterday'
      elsif date == Date.today
        output = 'Today'
      elsif date > Date.tomorrow
        output = "In #{diff[:day]} days"
      elsif date < Date.yesterday
        output = "#{diff[:day]} days ago"
      end 
    end

    return output
  end

  def format(text)
    output = ''
    output = text.gsub(/\r\n/, '<br />')
    return output.html_safe
  end

  def human_complexity(task)
    if task.easy?
      return 'Easy'
    elsif task.medium?
      return 'Medium'
    elsif task.hard?
      return 'Hard'
    else
      return 'Not Estimated' unless task.estimated?
    end
  end
end
