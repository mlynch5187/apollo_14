class AstronautMission < ApplicationRecord
  belongs_to :missions
  belongs_to :astronauts
end
