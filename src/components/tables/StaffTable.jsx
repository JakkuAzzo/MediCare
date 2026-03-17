export default function StaffTable({ staffMembers, onEdit, onDelete }) {
  return (
    <table className="table">
      <thead>
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Role</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        {staffMembers.length === 0 ? (
          <tr>
            <td colSpan="5">No staff found</td>
          </tr>
        ) : (
          staffMembers.map((staff) => (
            <tr key={staff.id}>
              <td>{staff.id}</td>
              <td>{staff.firstname}</td>
              <td>{staff.lastname}</td>
              <td>{staff.role}</td>
              <td>
                <button className="btn btn-sm btn-primary">Edit</button>
                <button
                  onClick={() => onDelete(staff.id)}
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
