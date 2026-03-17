export default function SearchBar({ placeholder = "Search...", onSearch }) {
  return (
    <input
      type="text"
      placeholder={placeholder}
      onChange={(e) => onSearch(e.target.value)}
      className="search-bar"
    />
  );
}
