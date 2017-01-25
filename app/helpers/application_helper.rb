module ApplicationHelper

  def difficulty_color(value)
    case value
      when 1
        'green'
      when 2
        'blue'
      when 3
        'red'
    end
  end
end
