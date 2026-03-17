import { useState, useEffect } from "react";

export default function AppointmentForm({
  appointment = null,
  onSubmit,
  isLoading = false
}) {
  const [formData, setFormData] = useState({
    AppointmentDatetime: "",
    AppointmentPatientID: "",
    AppointmentClinicID: "",
    AppointmentStaffID: "",
    AppointmentStatusID: ""
  });

  useEffect(() => {
    if (appointment) {
      setFormData(appointment);
    }
  }, [appointment]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    onSubmit(formData);
  };

  return (
    <form onSubmit={handleSubmit} className="form">
      <div className="form-group">
        <label htmlFor="AppointmentDatetime">Date & Time</label>
        <input
          type="datetime-local"
          id="AppointmentDatetime"
          name="AppointmentDatetime"
          value={formData.AppointmentDatetime}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="AppointmentPatientID">Patient ID</label>
        <input
          type="number"
          id="AppointmentPatientID"
          name="AppointmentPatientID"
          value={formData.AppointmentPatientID}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="AppointmentClinicID">Clinic ID</label>
        <input
          type="number"
          id="AppointmentClinicID"
          name="AppointmentClinicID"
          value={formData.AppointmentClinicID}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="AppointmentStaffID">Staff ID</label>
        <input
          type="number"
          id="AppointmentStaffID"
          name="AppointmentStaffID"
          value={formData.AppointmentStaffID}
          onChange={handleChange}
        />
      </div>

      <div className="form-group">
        <label htmlFor="AppointmentStatusID">Status ID</label>
        <input
          type="number"
          id="AppointmentStatusID"
          name="AppointmentStatusID"
          value={formData.AppointmentStatusID}
          onChange={handleChange}
        />
      </div>

      <button type="submit" className="btn btn-primary" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save Appointment"}
      </button>
    </form>
  );
}
