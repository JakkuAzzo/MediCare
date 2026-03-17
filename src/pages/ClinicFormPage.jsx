import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import ClinicForm from "../components/forms/ClinicForm";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import {
  getClinicById,
  createClinic,
  updateClinic
} from "../services/clinicService";

export default function ClinicFormPage({ mode }) {
  const navigate = useNavigate();
  const { id } = useParams();
  const isEdit = mode === "edit";

  const [clinic, setClinic] = useState(null);
  const [loading, setLoading] = useState(isEdit);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (isEdit && id) {
      loadClinic();
    }
  }, [isEdit, id]);

  async function loadClinic() {
    try {
      setLoading(true);
      const data = await getClinicById(id);
      setClinic(data);
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
        ClinicManagerID: Number(formData.ClinicManagerID)
      };

      if (isEdit) {
        await updateClinic(id, payload);
      } else {
        await createClinic(payload);
      }

      navigate("/clinics");
    } catch (err) {
      setError(err.message);
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <LoadingMessage />;

  return (
    <div className="page">
      <h1>{isEdit ? "Edit Clinic" : "Add Clinic"}</h1>
      {error && <ErrorMessage message={error} />}
      <ClinicForm clinic={clinic} onSubmit={handleSubmit} isLoading={saving} />
    </div>
  );
}
