import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import {
  getAppointments,
  deleteAppointment
} from "../services/appointmentService";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import AppointmentTable from "../components/tables/AppointmentTable";

export default function AppointmentsPage() {
  const [appointments, setAppointments] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadAppointments();
  }, []);

  async function loadAppointments() {
    try {
      setLoading(true);
      const data = await getAppointments();
      setAppointments(data);
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(appointmentId) {
    try {
      await deleteAppointment(appointmentId);
      setAppointments((prev) =>
        prev.filter((item) => item.AppointmentID !== appointmentId)
      );
    } catch (err) {
      setError(err.message);
    }
  }

  if (loading) return <LoadingMessage />;
  if (error) return <ErrorMessage message={error} />;

  return (
    <div className="page">
      <h1>Appointments</h1>
      <p>View all appointments</p>
      <Link to="/appointments/new" className="btn btn-primary">
        Schedule Appointment
      </Link>
      <AppointmentTable appointments={appointments} onDelete={handleDelete} />
    </div>
  );
}
