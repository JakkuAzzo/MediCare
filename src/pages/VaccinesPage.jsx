import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getVaccines, deleteVaccine } from "../services/vaccineService";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import VaccineTable from "../components/tables/VaccineTable";

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
      const data = await getVaccines();
      setVaccines(data);
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(vaccineId) {
    try {
      await deleteVaccine(vaccineId);
      setVaccines((prev) => prev.filter((item) => item.VaccineID !== vaccineId));
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Vaccines</h1>
      <p>View all vaccines</p>
      <Link to="/vaccines/new" className="btn btn-primary">
        Add Vaccine
      </Link>
      <VaccineTable vaccines={vaccines} onDelete={handleDelete} />
    </div>
  );
}
