class AlarmConditionsController < ApplicationController
	def new
    @alarm = Alarm.find(params[:alarm_id])
    @alarm_condition = @alarm.alarm_conditions.build
    @alarm_condition.save
    redirect_to edit_alarm_path(@alarm)
  end
end
