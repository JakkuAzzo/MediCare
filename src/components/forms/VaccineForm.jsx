import { useState, useEffect } from "react";

export default function VaccineForm({
  vaccine = null,
  onSubmit,
  isLoading = false
}) {
  const [formData, setFormData] = useState({
    VaccineName: "",
    VaccineCost: ""
  });

  useEffect(() => {
    if (vaccine) {
      setFormData(vaccine);
    }
  }, [vaccine]);

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
        <label htmlFor="VaccineName">Vaccine Name</label>
        <input
          type="text"
          id="VaccineName"
          name="VaccineName"
          value={formData.VaccineName}
          onChange={handleChange}
          required
        />
      </div>

      <div className="form-group">
        <label htmlFor="VaccineCost">Cost</label>
        <input
          type="number"
          step="0.01"
          id="VaccineCost"
          name="VaccineCost"
          value={formData.VaccineCost}
          onChange={handleChange}
        />
      </div>

      <button type="submit" className="btn btn-primary" disabled={isLoading}>
        {isLoading ? "Saving..." : "Save Vaccine"}
      </button>
    </form>
  );
}
