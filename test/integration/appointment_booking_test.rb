require "test_helper"

class AppointmentBookingTest < ActionDispatch::IntegrationTest
  test "patient can view booking form and book an appointment" do
    patient = create_patient
    department = Department.create!(department_name: "General Medicine")
    doctor = create_doctor(department)
    slot = Slot.create!(
      doctor: doctor,
      department_id: department.id,
      start_time: "09:00",
      end_time: "09:30"
    )

    post login_users_path, params: {
      user: { username: patient.user.username, password: "patient123" }
    }
    assert_redirected_to users_path

    get new_appointment_path
    assert_response :success
    assert_select "form[action='#{appointments_path}']"
    assert_select "input[name='appointment[patient_id]'][value='#{patient.id}']"

    post appointments_path, params: {
      appointment: {
        department_id: department.id,
        doctor_id: doctor.id,
        patient_id: patient.id,
        slot_id: slot.id,
        "appointment_date(1i)" => Date.current.year.to_s,
        "appointment_date(2i)" => Date.current.month.to_s,
        "appointment_date(3i)" => Date.current.day.to_s
      }
    }

    appointment = Appointment.order(:id).last
    assert_redirected_to appointment_path(appointment)
    assert_equal patient.id, appointment.patient_id
    assert_equal doctor.id, appointment.doctor_id
    assert_equal slot.id, appointment.slot_id
    assert_equal Date.current, appointment.appointment_date
  end

  private

  def create_patient
    Patient.create!(
      first_name: "Pat",
      last_name: "Example",
      date_of_birth: Date.new(1990, 1, 2),
      contact_number: "555-0100",
      address: "1 Main Street",
      email: "pat@example.com",
      gender: "other",
      blood_group: "O+"
    )
  end

  def create_doctor(department)
    user = User.create!(
      first_name: "Doc",
      last_name: "Example",
      username: "doc@example.com",
      user_type: "doctor",
      password: "doctor-password"
    )

    Doctor.create!(
      user: user,
      first_name: "Doc",
      last_name: "Example",
      date_of_birth: Date.new(1980, 1, 2),
      address: "2 Main Street",
      contact_number: "555-0101",
      email: "doc@example.com",
      gender: "other",
      nationality: "Example",
      qualification: "MD",
      department: department
    )
  end
end
