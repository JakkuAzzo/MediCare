import BASE_URL, { getAuthHeaders } from "../config/api";

export async function getVaccines() {
  const response = await fetch(`${BASE_URL}/vaccines`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch vaccines: ${response.statusText}`);
  }

  return response.json();
}

export async function getVaccineById(id) {
  const response = await fetch(`${BASE_URL}/vaccines/${id}`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch vaccine: ${response.statusText}`);
  }

  return response.json();
}

export async function createVaccine(vaccineData) {
  const response = await fetch(`${BASE_URL}/vaccines`, {
    method: "POST",
    headers: getAuthHeaders(),
    body: JSON.stringify(vaccineData)
  });

  if (!response.ok) {
    throw new Error(`Failed to create vaccine: ${response.statusText}`);
  }

  return response.json();
}

export async function updateVaccine(id, vaccineData) {
  const response = await fetch(`${BASE_URL}/vaccines/${id}`, {
    method: "PUT",
    headers: getAuthHeaders(),
    body: JSON.stringify(vaccineData)
  });

  if (!response.ok) {
    throw new Error(`Failed to update vaccine: ${response.statusText}`);
  }

  return response.json();
}

export async function deleteVaccine(id) {
  const response = await fetch(`${BASE_URL}/vaccines/${id}`, {
    method: "DELETE",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to delete vaccine: ${response.statusText}`);
  }

  return response.json();
}
