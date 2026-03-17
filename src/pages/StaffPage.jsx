import { useEffect, useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { getStaff, deleteStaff } from "../services/staffService";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import StaffTable from "../components/tables/StaffTable";

export default function StaffPage() {
  const navigate = useNavigate();
  const [staff, setStaff] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadStaff();
  }, []);

  async function loadStaff() {
    try {
      setLoading(true);
      const data = await getStaff();
      setStaff(data);
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  function handleEdit(staffId) {
    navigate(`/staff/${staffId}/edit`);
  }

  async function handleDelete(staffId) {
    try {
      await deleteStaff(staffId);
      setStaff((prev) => prev.filter((item) => item.StaffID !== staffId));
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Staff</h1>
      <p>View all staff members</p>
      <Link to="/staff/new" className="btn btn-primary">
        Add Staff
      </Link>
      <StaffTable
        staffMembers={staff}
        onEdit={handleEdit}
        onDelete={handleDelete}
      />
    </div>
  );
}
