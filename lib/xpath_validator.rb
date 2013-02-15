# Custom XPath Validator
class XpathValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? || Nokogiri.HTML('<html><body></body></html>').xpath(value).nil?
      record.errors[attribute] << 'must be a valid XPath Expression'
    end
  rescue Nokogiri::XML::XPath::SyntaxError
    record.errors[attribute] << 'must be a valid XPath Expression'
  end
end

