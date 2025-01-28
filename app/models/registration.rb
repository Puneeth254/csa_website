class Registration < ApplicationRecord
    validates :team_name, presence: true
    validates :players, presence: true
end