module RequestsHelper

  def filter_message options
    message = "<p>"
    message += "Ports from <i>#{options['from']}</i> " if options["from"].present?
    message += "to <i>#{options['to']}</i> " if options["to"].present?
    message += "requested by <i>#{options['by']}</i> " if options["by"].present?
    message += "upvoted by <i>#{options['interested']}</i> " if options["interested"].present?
    message
  end
end
