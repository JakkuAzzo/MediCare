import { useEffect, useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { getClinics, deleteClinic } from "../services/clinicService";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import ClinicTable from "../components/tables/ClinicTable";

export default function ClinicsPage() {
  const navigate = useNavigate();
  const [clinics, setClinics] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadClinics();
  }, []);

  async function loadClinics() {
    try {
      setLoading(true);
      const data = await getClinics();
      setClinics(data);
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  function handleEdit(clinicId) {
    navigate(`/clinics/${clinicId}/edit`);
  }

  async function handleDelete(clinicId) {
    try {
      await deleteClinic(clinicId);
      setClinics((prev) => prev.filter((item) => item.ClinicID !== clinicId));
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Clinics</h1>
      <p>View all clinics</p>
      <Link to="/clinics/new" className="btn btn-primary">
        Add Clinic
      </Link>
      <ClinicTable
        clinics={clinics}
        onEdit={handleEdit}
        onDelete={handleDelete}
      />
    </div>
  );
}
