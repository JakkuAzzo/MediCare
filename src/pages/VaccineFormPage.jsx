import { useParams } from "react-router-dom";

export default function VaccineFormPage({ mode }) {
  const { id } = useParams();

  return (
    <div className="page">
      <h1>{mode === "create" ? "Add Vaccine" : "Edit Vaccine"}</h1>
      <p>Vaccine form</p>
    </div>
  );
}
