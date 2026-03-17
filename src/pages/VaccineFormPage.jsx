import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import VaccineForm from "../components/forms/VaccineForm";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import {
  getVaccineById,
  createVaccine,
  updateVaccine
} from "../services/vaccineService";

export default function VaccineFormPage({ mode }) {
  const navigate = useNavigate();
  const { id } = useParams();
  const isEdit = mode === "edit";

  const [vaccine, setVaccine] = useState(null);
  const [loading, setLoading] = useState(isEdit);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (isEdit && id) {
      loadVaccine();
    }
  }, [isEdit, id]);

  async function loadVaccine() {
    try {
      setLoading(true);
      const data = await getVaccineById(id);
      setVaccine(data);
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
        VaccineCost: Number(formData.VaccineCost)
      };

      if (isEdit) {
        await updateVaccine(id, payload);
      } else {
        await createVaccine(payload);
      }

      navigate("/vaccines");
    } catch (err) {
      setError(err.message);
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <LoadingMessage />;

  return (
    <div className="page">
      <h1>{mode === "create" ? "Add Vaccine" : "Edit Vaccine"}</h1>
      {error && <ErrorMessage message={error} />}
      <VaccineForm vaccine={vaccine} onSubmit={handleSubmit} isLoading={saving} />
    </div>
  );
}
