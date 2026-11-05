require "test_helper"

class PatientRegistrationTest < ActionDispatch::IntegrationTest
  test "visitor can view the patient registration form" do
    get new_patient_patients_path

    assert_response :success
    assert_select "form", 1
    assert_select "input[name='patient[first_name]']"
    assert_select "input[name='patient[email]']"
  end

  test "visitor can register a patient profile" do
    post patients_path, params: {
      patient: {
        first_name: "Pat",
        last_name: "Example",
        date_of_birth: "1990-01-02",
        contact_number: "555-0100",
        address: "1 Main Street",
        email: "pat@example.com",
        gender: "other",
        blood_group: "O+"
      }
    }

    assert_response :redirect
    patient = Patient.find_by!(email: "pat@example.com")
    assert_equal "Pat", patient.user.first_name
    assert_equal "Patient", patient.user.user_type

    assert_equal patient.user.id, User.find_by!(username: "PatExample123").id
  end
end
