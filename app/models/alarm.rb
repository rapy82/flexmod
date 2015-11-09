class Alarm < ActiveRecord::Base
	has_many :alarm_conditions
	accepts_nested_attributes_for :alarm_conditions , allow_destroy: true
end
