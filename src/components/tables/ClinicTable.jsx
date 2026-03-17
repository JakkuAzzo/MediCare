export default function ClinicTable({ clinics, onEdit, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Location</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {clinics.length === 0 ? (
          <tr>
            <td colSpan="4">No clinics found</td>
          </tr>
        ) : (
          clinics.map((clinic) => {
            const clinicId = clinic.ClinicID ?? clinic.id;
            const clinicName = clinic.ClinicName ?? clinic.name;
            const clinicLocation = clinic.ClinicAddress ?? clinic.location;

            return (
            <tr key={clinicId}>
              <td>{clinicId}</td>
              <td>{clinicName}</td>
              <td>{clinicLocation}</td>
              <td>
                <button
                  className="btn btn-sm btn-primary"
                  onClick={() => onEdit?.(clinicId)}
                >
                  Edit
                </button>
                <button
                  className="btn btn-sm btn-delete"
                  onClick={() => onDelete?.(clinicId)}
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
