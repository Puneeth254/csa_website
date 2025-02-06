class Event < ApplicationRecord
    validates :event_name, presence: true, uniqueness: {case_sensitive: false}
end
