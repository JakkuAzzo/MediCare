import { useAuth } from "../context/AuthContext";
import { Link } from "react-router-dom";
import clinicImage from "../assets/clinic.jpg";
import patientImage from "../assets/patient.jpg";
import appointmentsImage from "../assets/appointments.jpg";
import vaccinesImage from "../assets/vaccines.jpeg";
import staffImage from "../assets/staff.png";

export default function DashboardPage() {
  const { user } = useAuth();

  const cards = [
    {
      title: "Clinics",
      description: "Find nearby clinics, check locations, and plan appointments quickly.",
      cta: "View Clinics",
      to: "/clinics",
      image: clinicImage,
      alt: "Walk-in clinic waiting area"
    },
    {
      title: "Patients",
      description: "Create and update patient profiles with clean, searchable records.",
      cta: "Manage Patients",
      to: "/patients",
      image: patientImage,
      alt: "Patient in consultation"
    },
    {
      title: "Appointments",
      description: "Schedule, view, and edit bookings in one streamlined workflow.",
      cta: "View Appointments",
      to: "/appointments",
      image: appointmentsImage,
      alt: "Patient and clinician in a ward"
    },
    {
      title: "Vaccines",
      description: "Track vaccine availability and pricing with clear, fast access.",
      cta: "View Vaccines",
      to: "/vaccines",
      image: vaccinesImage,
      alt: "Vaccine vials and syringe"
    },
    {
      title: "Staff",
      description: "Manage team details and roles across clinics from one place.",
      cta: "View Staff",
      to: "/staff",
      image: staffImage,
      alt: "Healthcare staff group"
    }
  ];

  const userName =
    user?.FirstName || user?.name || user?.Email || user?.email || "there";

  return (
    <div className="page dashboard-page">
      <section className="dashboard-hero">
        <p className="dashboard-eyebrow">Travel Jabs Workspace</p>
        <h1>Welcome back, {userName}.</h1>
        <p className="subtitle">
          Manage clinics, patients, appointments, vaccines, and staff through a
          calm, focused dashboard.
        </p>
      </section>

      <div className="dashboard-grid">
        {cards.map(card => (
          <article className="dashboard-card" key={card.title}>
            <div className="dashboard-card-media-wrap">
              <img className="dashboard-card-media" src={card.image} alt={card.alt} />
            </div>
            <div className="dashboard-card-content">
              <h3>{card.title}</h3>
              <p>{card.description}</p>
              <Link to={card.to} className="btn btn-primary">
                {card.cta}
              </Link>
            </div>
          </article>
        ))}
      </div>

    </div>
  );
}
