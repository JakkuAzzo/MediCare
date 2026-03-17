export default function SortSelect({ options, onSort }) {
  return (
    <select onChange={(e) => onSort(e.target.value)} className="sort-select">
      <option value="">Sort by...</option>
      {options.map((option) => (
        <option key={option} value={option}>
          {option}
        </option>
      ))}
    </select>
  );
}
