class Photo < ApplicationRecord
  enum license: %i[copyright copyleft creative_commons]
end
