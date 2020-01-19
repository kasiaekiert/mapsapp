class NameLenghtValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless options.key?(:minimum)

    name_size = (value.try(:size) || 0)
    minimum = options[:minimum]
    return if name_size >= minimum

    record.errors.add(attribute, :too_short_name, count: minimum)
  end
end