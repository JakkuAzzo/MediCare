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
          clinics.map((clinic) => (
            <tr key={clinic.id}>
              <td>{clinic.id}</td>
              <td>{clinic.name}</td>
              <td>{clinic.location}</td>
              <td>
                <button className="btn btn-sm btn-primary">Edit</button>
                <button className="btn btn-sm btn-delete">Delete</button>
              </td>
            </tr>
          ))
        )}
      </tbody>
    </table>
  );
}
