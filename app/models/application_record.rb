#keeps track of applications


class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
