import { useState, useEffect } from "react";

export default function StaffForm({ staff = null, onSubmit, isLoading = false }) {
  const [formData, setFormData] = useState({
    StaffFirstname: "",
    StaffLastname: "",
    StaffRoleID: "",
    StaffClinicID: ""
  });

  useEffect(() => {
    if (staff) {
      setFormData((prev) => ({
        ...prev,
        ...staff
      }));
    }
  }, [staff]);

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
        <label htmlFor="StaffFirstname">First Name</label>
        <input
          id="StaffFirstname"
          name="StaffFirstname"
          value={formData.StaffFirstname}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="StaffLastname">Last Name</label>
        <input
          id="StaffLastname"
          name="StaffLastname"
          value={formData.StaffLastname}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="StaffRoleID">Role ID</label>
        <input
          type="number"
          id="StaffRoleID"
          name="StaffRoleID"
          value={formData.StaffRoleID}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="StaffClinicID">Clinic ID</label>
        <input
          type="number"
          id="StaffClinicID"
          name="StaffClinicID"
          value={formData.StaffClinicID}
          onChange={handleChange}
          required
        />
      </div>

      <button className="btn btn-primary" type="submit" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save Staff"}
      </button>
    </form>
  );
}
