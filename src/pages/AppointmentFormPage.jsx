import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import AppointmentForm from "../components/forms/AppointmentForm";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import {
  getAppointmentById,
  createAppointment,
  updateAppointment
} from "../services/appointmentService";

function toDateTimeLocal(value) {
  if (!value) return "";
  return new Date(value).toISOString().slice(0, 16);
}

export default function AppointmentFormPage({ mode }) {
  const navigate = useNavigate();
  const { id } = useParams();
  const isEdit = mode === "edit";

  const [appointment, setAppointment] = useState(null);
  const [loading, setLoading] = useState(isEdit);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (isEdit && id) {
      loadAppointment();
    }
  }, [isEdit, id]);

  async function loadAppointment() {
    try {
      setLoading(true);
      const data = await getAppointmentById(id);
      setAppointment({
        ...data,
        AppointmentDatetime: toDateTimeLocal(data.AppointmentDatetime)
      });
      setError(null);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  async function handleSubmit(formData) {
    try {
      setSaving(true);
      const payload = {
        ...formData,
        AppointmentDatetime: new Date(formData.AppointmentDatetime).toISOString(),
        AppointmentPatientID: Number(formData.AppointmentPatientID),
        AppointmentClinicID: Number(formData.AppointmentClinicID),
        AppointmentStaffID: Number(formData.AppointmentStaffID),
        AppointmentStatusID: Number(formData.AppointmentStatusID)
      };

      if (isEdit) {
        await updateAppointment(id, payload);
      } else {
        await createAppointment(payload);
      }

      navigate("/appointments");
    } catch (err) {
      setError(err.message);
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <LoadingMessage />;

  return (
    <div className="page">
      <h1>
        {mode === "create" ? "Schedule Appointment" : "Reschedule Appointment"}
      </h1>
      {error && <ErrorMessage message={error} />}
      <AppointmentForm
        appointment={appointment}
        onSubmit={handleSubmit}
        isLoading={saving}
      />
    </div>
  );
}
