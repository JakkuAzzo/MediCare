export default function StatusBadge({ status }) {
  const statusClass = `status-${status ? status.toLowerCase() : "unknown"}`;
  return <span className={`badge ${statusClass}`}>{status}</span>;
}
