import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { getPatients, deletePatient } from "../services/patientService";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import PatientTable from "../components/tables/PatientTable";

export default function PatientsPage() {
  const [patients, setPatients] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadPatients();
  }, []);

  async function loadPatients() {
    try {
      setLoading(true);
      const data = await getPatients();
      setPatients(data);
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(patientId) {
    try {
      await deletePatient(patientId);
      setPatients((prev) => prev.filter((item) => item.PatientID !== patientId));
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Patients</h1>
      <p>View all patients</p>
      <Link to="/patients/new" className="btn btn-primary">
        Add Patient
      </Link>
      <PatientTable patients={patients} onDelete={handleDelete} />
    </div>
  );
}
