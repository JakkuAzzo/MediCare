import { Link } from "react-router-dom";

export default function AppointmentTable({ appointments, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Date/Time</th>
          <th>Patient ID</th>
          <th>Clinic ID</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {appointments.length === 0 ? (
          <tr>
            <td colSpan="6">No appointments found</td>
          </tr>
        ) : (
          appointments.map((apt) => {
            const appointmentId = apt.AppointmentID ?? apt.id;

            return (
            <tr key={appointmentId}>
              <td>{appointmentId}</td>
              <td>{apt.AppointmentDatetime}</td>
              <td>{apt.AppointmentPatientID}</td>
              <td>{apt.AppointmentClinicID}</td>
              <td>{apt.AppointmentStatusName ?? apt.AppointmentStatusID}</td>
              <td>
                <Link
                  to={`/appointments/${appointmentId}/edit`}
                  className="btn btn-sm btn-primary"
                >
                  Reschedule
                </Link>
                <button
                  onClick={() => onDelete?.(appointmentId)}
                  className="btn btn-sm btn-delete"
                >
                  Cancel
                </button>
              </td>
            </tr>
            );
          })
        )}
      </tbody>
    </table>
  );
}
