class Task < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

end
