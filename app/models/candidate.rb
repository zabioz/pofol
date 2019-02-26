class Candidate < ApplicationRecord
    has_many :vote_logs, dependent: :destroy
    has_many :pictures
end
