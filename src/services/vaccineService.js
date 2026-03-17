const BASE_URL = "http://localhost:3000/api";

export async function getVaccines() {
  const response = await fetch(`${BASE_URL}/vaccines`);
  if (!response.ok) {
    throw new Error("Failed to fetch vaccines");
  }
  return response.json();
}

export async function getVaccineById(id) {
  const response = await fetch(`${BASE_URL}/vaccines/${id}`);
  if (!response.ok) {
    throw new Error("Failed to fetch vaccine");
  }
  return response.json();
}

export async function createVaccine(vaccineData) {
  const response = await fetch(`${BASE_URL}/vaccines`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(vaccineData)
  });

  if (!response.ok) {
    throw new Error("Failed to create vaccine");
  }

  return response.json();
}

export async function updateVaccine(id, vaccineData) {
  const response = await fetch(`${BASE_URL}/vaccines/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(vaccineData)
  });

  if (!response.ok) {
    throw new Error("Failed to update vaccine");
  }

  return response.json();
}

export async function deleteVaccine(id) {
  const response = await fetch(`${BASE_URL}/vaccines/${id}`, {
    method: "DELETE"
  });

  if (!response.ok) {
    throw new Error("Failed to delete vaccine");
  }

  return response.json();
}
