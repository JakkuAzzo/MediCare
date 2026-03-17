import { useParams } from "react-router-dom";

export default function PatientFormPage({ mode }) {
  const { id } = useParams();

  return (
    <div className="page">
      <h1>{mode === "create" ? "Add Patient" : "Edit Patient"}</h1>
      <p>Patient form</p>
    </div>
  );
}
