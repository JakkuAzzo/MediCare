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
          patients.map((patient) => (
            <tr key={patient.id}>
              <td>{patient.id}</td>
              <td>{patient.PatientFirstname}</td>
              <td>{patient.PatientLastname}</td>
              <td>{patient.Patientage}</td>
              <td>
                <Link
                  to={`/patients/${patient.id}/edit`}
                  className="btn btn-sm btn-primary"
                >
                  Edit
                </Link>
                <button
                  onClick={() => onDelete(patient.id)}
                  className="btn btn-sm btn-delete"
                >
                  Delete
                </button>
              </td>
            </tr>
          ))
        )}
      </tbody>
    </table>
  );
}
