module FriendlyDatetime
  extend ActiveSupport::Concern

  def self.parse_date(date)
    return date if date.match(/\d{4}-\d{2}-\d{2}/)

    @length = /\d+/.match(date)
    @duration = /[h|d|w|mo|y]/.match(date)
    @time = /\d+(:\d{2})?(am|pm)/.match(date)

    return parser
  end

  def self.parse_duration
    aliases = { 'm': 'minute',
      'h': 'hour',
      'd': 'day',
      'w': 'week',
      'mo': 'month',
      'y': 'year'
    }

    converted_duration = ''

    if aliases.has_key?(@duration[0].to_sym)
      converted_duration = aliases[@duration[0].to_sym]
      converted_duration = @length[0].to_i > 1 ? converted_duration.pluralize : converted_duration
    end

    due_on = convert_date(converted_duration, @length)

    return due_on
  end

  def self.parse_time
    t = DateTime.parse(@time[0]).strftime("%H:%M")

    return t
  end

  def self.convert_date(duration, length)
    date_method = "#{length}.#{duration}"
    due_date = Date.today + eval(date_method)

    return due_date
  end

  def self.parser
    dur = parse_time.to_s + ':00'
    datetime = "#{parse_duration} #{dur}"

    return datetime
  end
end
