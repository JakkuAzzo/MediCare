import { Link } from "react-router-dom";

export default function VaccineTable({ vaccines, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Cost</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {vaccines.length === 0 ? (
          <tr>
            <td colSpan="4">No vaccines found</td>
          </tr>
        ) : (
          vaccines.map((vaccine) => (
            <tr key={vaccine.id}>
              <td>{vaccine.id}</td>
              <td>{vaccine.VaccineName}</td>
              <td>
                £{vaccine.VaccineCost ? vaccine.VaccineCost.toFixed(2) : "0.00"}
              </td>
              <td>
                <Link
                  to={`/vaccines/${vaccine.id}/edit`}
                  className="btn btn-sm btn-primary"
                >
                  Edit
                </Link>
                <button
                  onClick={() => onDelete(vaccine.id)}
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
