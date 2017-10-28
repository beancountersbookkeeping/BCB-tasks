class Task < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :company, dependent: :destroy
end
