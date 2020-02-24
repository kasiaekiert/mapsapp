# frozen_string_literal: true

module ApplicationHelper
  def flash_message
    flash.map do |key, value|
      level_class = case key
                    when 'notice' then 'alert alert-info'
                    when 'success' then 'alert alert-success'
                    when 'error' then 'alert alert-danger'
                    when 'alert' then 'alert alert-warning'
                    end
      content_tag :div, class: level_class do
        [value, button_tag].join('').html_safe
      end
    end.join('').html_safe
  end

  def button_tag
    content_tag :button, class: 'close', 'data-dismiss' => 'alert', type: 'button' do
      [
        content_tag(:span, 'x', 'aria-hidden' => 'true'),
        content_tag(:span, 'Close', class: 'sr-only')
      ].join('').html_safe
    end
  end

  def event_status(event)
    status_class = case event.status
                   when :incomming then 'badge badge-primary'
                   when :in_progress then 'badge badge-info'
                   when :finished then 'badge badge-secondary'
                   end
    content_tag :span, class: status_class do
      t("statuses.#{event.status}")
    end
  end
end
