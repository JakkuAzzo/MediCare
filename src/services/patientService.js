import BASE_URL, { getAuthHeaders } from "../config/api";

export async function getPatients() {
  const response = await fetch(`${BASE_URL}/patients`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch patients: ${response.statusText}`);
  }

  return response.json();
}

export async function getPatientById(id) {
  const response = await fetch(`${BASE_URL}/patients/${id}`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch patient: ${response.statusText}`);
  }

  return response.json();
}

export async function createPatient(patientData) {
  const response = await fetch(`${BASE_URL}/patients`, {
    method: "POST",
    headers: getAuthHeaders(),
    body: JSON.stringify(patientData)
  });

  if (!response.ok) {
    throw new Error(`Failed to create patient: ${response.statusText}`);
  }

  return response.json();
}

export async function updatePatient(id, patientData) {
  const response = await fetch(`${BASE_URL}/patients/${id}`, {
    method: "PUT",
    headers: getAuthHeaders(),
    body: JSON.stringify(patientData)
  });

  if (!response.ok) {
    throw new Error(`Failed to update patient: ${response.statusText}`);
  }

  return response.json();
}

export async function deletePatient(id) {
  const response = await fetch(`${BASE_URL}/patients/${id}`, {
    method: "DELETE",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to delete patient: ${response.statusText}`);
  }

  return response.json();
}
