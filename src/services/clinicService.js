import BASE_URL, { getAuthHeaders } from "../config/api";

export async function getClinics() {
  const response = await fetch(`${BASE_URL}/clinics`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch clinics: ${response.statusText}`);
  }

  return response.json();
}

export async function getClinicById(id) {
  const response = await fetch(`${BASE_URL}/clinics/${id}`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch clinic: ${response.statusText}`);
  }

  return response.json();
}

export async function createClinic(clinicData) {
  const response = await fetch(`${BASE_URL}/clinics`, {
    method: "POST",
    headers: getAuthHeaders(),
    body: JSON.stringify(clinicData)
  });

  if (!response.ok) {
    throw new Error(`Failed to create clinic: ${response.statusText}`);
  }

  return response.json();
}

export async function updateClinic(id, clinicData) {
  const response = await fetch(`${BASE_URL}/clinics/${id}`, {
    method: "PUT",
    headers: getAuthHeaders(),
    body: JSON.stringify(clinicData)
  });

  if (!response.ok) {
    throw new Error(`Failed to update clinic: ${response.statusText}`);
  }

  return response.json();
}

export async function deleteClinic(id) {
  const response = await fetch(`${BASE_URL}/clinics/${id}`, {
    method: "DELETE",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to delete clinic: ${response.statusText}`);
  }

  return response.status === 204 ? null : response.json();
}
