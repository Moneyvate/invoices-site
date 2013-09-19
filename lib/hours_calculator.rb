class HoursCalculator
  attr_accessor :log, :hours
  attr_reader :start_date, :start_time, :end_date, :end_time

  def initialize(log)
    @log = log

    @start_date = @log.start_date
    @start_time = @log.start_time
    @end_date = @log.end_date
    @end_time = @log.end_time
  end

  def calculate
    dt_start = DateTime.new(@start_date.year, @start_date.month, @start_date.day, @start_time.hour, @start_time.min, 0)
    dt_end = DateTime.new(@end_date.year, @end_date.month, @end_date.day, @end_time.hour, @end_time.min, 0)

    hours = Time.diff(dt_start, dt_end, '%h')
    mins = Time.diff(dt_start, dt_end, '%m')

    return hours[:diff].to_i
  end
end
