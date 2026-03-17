import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import StaffForm from "../components/forms/StaffForm";
import LoadingMessage from "../components/common/LoadingMessage";
import ErrorMessage from "../components/common/ErrorMessage";
import { getStaffById, createStaff, updateStaff } from "../services/staffService";

export default function StaffFormPage({ mode }) {
  const navigate = useNavigate();
  const { id } = useParams();
  const isEdit = mode === "edit";

  const [staff, setStaff] = useState(null);
  const [loading, setLoading] = useState(isEdit);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (isEdit && id) {
      loadStaff();
    }
  }, [isEdit, id]);

  async function loadStaff() {
    try {
      setLoading(true);
      const data = await getStaffById(id);
      setStaff(data);
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
        StaffRoleID: Number(formData.StaffRoleID),
        StaffClinicID: Number(formData.StaffClinicID)
      };

      if (isEdit) {
        await updateStaff(id, payload);
      } else {
        await createStaff(payload);
      }

      navigate("/staff");
    } catch (err) {
      setError(err.message);
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <LoadingMessage />;

  return (
    <div className="page">
      <h1>{isEdit ? "Edit Staff" : "Add Staff"}</h1>
      {error && <ErrorMessage message={error} />}
      <StaffForm staff={staff} onSubmit={handleSubmit} isLoading={saving} />
    </div>
  );
}
