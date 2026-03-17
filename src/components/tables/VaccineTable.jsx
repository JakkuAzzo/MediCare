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
          vaccines.map((vaccine) => {
            const vaccineId = vaccine.VaccineID ?? vaccine.id;
            const vaccineCost = Number(vaccine.VaccineCost ?? 0);

            return (
            <tr key={vaccineId}>
              <td>{vaccineId}</td>
              <td>{vaccine.VaccineName}</td>
              <td>£{Number.isFinite(vaccineCost) ? vaccineCost.toFixed(2) : "0.00"}</td>
              <td>
                <Link
                  to={`/vaccines/${vaccineId}/edit`}
                  className="btn btn-sm btn-primary"
                >
                  Edit
                </Link>
                <button
                  onClick={() => onDelete?.(vaccineId)}
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
