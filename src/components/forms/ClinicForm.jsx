import { useState, useEffect } from "react";

export default function ClinicForm({ clinic = null, onSubmit, isLoading = false }) {
  const [formData, setFormData] = useState({
    ClinicName: "",
    ClinicAddress: "",
    ClinicPostcode: "",
    ClinicContact: "",
    ClinicManagerID: "",
    ClinicManagerFirstname: "",
    ClinicManagerLastname: ""
  });

  useEffect(() => {
    if (clinic) {
      setFormData({
        ...formData,
        ...clinic
      });
    }
  }, [clinic]);

  function handleChange(e) {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value
    }));
  }

  function handleSubmit(e) {
    e.preventDefault();
    onSubmit(formData);
  }

  return (
    <form onSubmit={handleSubmit} className="form">
      <div className="form-group">
        <label htmlFor="ClinicName">Clinic Name</label>
        <input
          id="ClinicName"
          name="ClinicName"
          value={formData.ClinicName}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="ClinicAddress">Address</label>
        <input
          id="ClinicAddress"
          name="ClinicAddress"
          value={formData.ClinicAddress}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="ClinicPostcode">Postcode</label>
        <input
          id="ClinicPostcode"
          name="ClinicPostcode"
          value={formData.ClinicPostcode}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="ClinicContact">Contact</label>
        <input
          id="ClinicContact"
          name="ClinicContact"
          value={formData.ClinicContact}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="ClinicManagerID">Manager ID</label>
        <input
          type="number"
          id="ClinicManagerID"
          name="ClinicManagerID"
          value={formData.ClinicManagerID}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="ClinicManagerFirstname">Manager First Name</label>
        <input
          id="ClinicManagerFirstname"
          name="ClinicManagerFirstname"
          value={formData.ClinicManagerFirstname}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="ClinicManagerLastname">Manager Last Name</label>
        <input
          id="ClinicManagerLastname"
          name="ClinicManagerLastname"
          value={formData.ClinicManagerLastname}
          onChange={handleChange}
          required
        />
      </div>

      <button className="btn btn-primary" type="submit" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save Clinic"}
      </button>
    </form>
  );
}
