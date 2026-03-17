export default function DeleteButton({ onDelete, label = "Delete" }) {
  return (
    <button onClick={onDelete} className="btn btn-delete">
      {label}
    </button>
  );
}
