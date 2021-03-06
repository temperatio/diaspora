module Diaspora::Guid
  # Creates a before_create callback which calls #set_guid and makes the guid serialize in to_xml
  def self.included(model)
    model.class_eval do
      before_create :set_guid
      xml_attr :guid
    end
  end

  # @return [String] The model's guid.
  def set_guid
    self.guid ||= ActiveSupport::SecureRandom.hex(8)
  end
end
