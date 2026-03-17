const BASE_URL = "http://localhost:3000/api";

export async function getClinics() {
  const response = await fetch(`${BASE_URL}/clinics`);
  if (!response.ok) {
    throw new Error("Failed to fetch clinics");
  }
  return response.json();
}

export async function getClinicById(id) {
  const response = await fetch(`${BASE_URL}/clinics/${id}`);
  if (!response.ok) {
    throw new Error("Failed to fetch clinic");
  }
  return response.json();
}

export async function createClinic(clinicData) {
  const response = await fetch(`${BASE_URL}/clinics`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(clinicData)
  });

  if (!response.ok) {
    throw new Error("Failed to create clinic");
  }

  return response.json();
}

export async function updateClinic(id, clinicData) {
  const response = await fetch(`${BASE_URL}/clinics/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(clinicData)
  });

  if (!response.ok) {
    throw new Error("Failed to update clinic");
  }

  return response.json();
}

export async function deleteClinic(id) {
  const response = await fetch(`${BASE_URL}/clinics/${id}`, {
    method: "DELETE"
  });

  if (!response.ok) {
    throw new Error("Failed to delete clinic");
  }

  return response.json();
}
