import { useEffect, useState } from "react";

export default function ClinicsPage() {
  const [clinics, setClinics] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadClinics();
  }, []);

  async function loadClinics() {
    try {
      setLoading(true);
      // TODO: call getClinics() from clinicService
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  if (loading) return <p>Loading clinics...</p>;
  if (error) return <p className="error">Error: {error}</p>;

  return (
    <div className="page">
      <h1>Clinics</h1>
      <p>View all clinics</p>
    </div>
  );
}
