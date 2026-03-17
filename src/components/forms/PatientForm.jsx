import { useState, useEffect } from "react";

export default function PatientForm({
  patient = null,
  onSubmit,
  isLoading = false
}) {
  const [formData, setFormData] = useState({
    PatientFirstname: "",
    PatientLastname: "",
    PatientAddress: "",
    PatientPostcode: "",
    Patientage: ""
  });

  useEffect(() => {
    if (patient) {
      setFormData(patient);
    }
  }, [patient]);

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
        <label htmlFor="PatientFirstname">First Name</label>
        <input
          type="text"
          id="PatientFirstname"
          name="PatientFirstname"
          value={formData.PatientFirstname}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="PatientLastname">Last Name</label>
        <input
          type="text"
          id="PatientLastname"
          name="PatientLastname"
          value={formData.PatientLastname}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="PatientAddress">Address</label>
        <input
          type="text"
          id="PatientAddress"
          name="PatientAddress"
          value={formData.PatientAddress}
          onChange={handleChange}
        />
      </div>

      <div className="form-group">
        <label htmlFor="PatientPostcode">Postcode</label>
        <input
          type="text"
          id="PatientPostcode"
          name="PatientPostcode"
          value={formData.PatientPostcode}
          onChange={handleChange}
        />
      </div>

      <div className="form-group">
        <label htmlFor="Patientage">Age</label>
        <input
          type="number"
          id="Patientage"
          name="Patientage"
          value={formData.Patientage}
          onChange={handleChange}
        />
      </div>

      <button type="submit" className="btn btn-primary" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save Patient"}
      </button>
    </form>
  );
}
