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
          staffMembers.map((staff) => {
            const staffId = staff.StaffID ?? staff.id;

            return (
            <tr key={staffId}>
              <td>{staffId}</td>
              <td>{staff.StaffFirstname ?? staff.firstname}</td>
              <td>{staff.StaffLastname ?? staff.lastname}</td>
              <td>{staff.StaffRole ?? staff.role}</td>
              <td>
                <button
                  className="btn btn-sm btn-primary"
                  onClick={() => onEdit?.(staffId)}
                >
                  Edit
                </button>
                <button
                  onClick={() => onDelete?.(staffId)}
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
