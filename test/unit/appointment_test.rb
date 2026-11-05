require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  test "requires a doctor, patient, slot, and appointment date" do
    appointment = Appointment.new

    assert_not appointment.valid?
    assert_includes appointment.errors.attribute_names, :doctor
    assert_includes appointment.errors.attribute_names, :patient
    assert_includes appointment.errors.attribute_names, :slot
    assert_includes appointment.errors.attribute_names, :appointment_date
  end
end
