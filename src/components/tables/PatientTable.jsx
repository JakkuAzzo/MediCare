import { Link } from "react-router-dom";

export default function PatientTable({ patients, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Age</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {patients.length === 0 ? (
          <tr>
            <td colSpan="5">No patients found</td>
          </tr>
        ) : (
          patients.map((patient) => {
            const patientId = patient.PatientID ?? patient.id;

            return (
            <tr key={patientId}>
              <td>{patientId}</td>
              <td>{patient.PatientFirstname}</td>
              <td>{patient.PatientLastname}</td>
              <td>{patient.Patientage}</td>
              <td>
                <Link
                  to={`/patients/${patientId}/edit`}
                  className="btn btn-sm btn-primary"
                >
                  Edit
                </Link>
                <button
                  onClick={() => onDelete?.(patientId)}
                  className="btn btn-sm btn-delete"
                >
                  Delete
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
