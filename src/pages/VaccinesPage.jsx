import { useEffect, useState } from "react";

export default function VaccinesPage() {
  const [vaccines, setVaccines] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadVaccines();
  }, []);

  async function loadVaccines() {
    try {
      setLoading(true);
      // TODO: call getVaccines() from vaccineService
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  if (loading) return <p>Loading vaccines...</p>;
  if (error) return <p className="error">Error: {error}</p>;

  return (
    <div className="page">
      <h1>Vaccines</h1>
      <p>View all vaccines</p>
    </div>
  );
}
