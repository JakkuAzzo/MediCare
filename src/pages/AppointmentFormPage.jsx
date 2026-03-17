import { useParams } from "react-router-dom";

export default function AppointmentFormPage({ mode }) {
  const { id } = useParams();

  return (
    <div className="page">
      <h1>
        {mode === "create" ? "Schedule Appointment" : "Reschedule Appointment"}
      </h1>
      <p>Appointment form</p>
    </div>
  );
}
