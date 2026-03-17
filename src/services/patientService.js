const BASE_URL = "http://localhost:3000/api";

export async function getPatients() {
  const response = await fetch(`${BASE_URL}/patients`);
  if (!response.ok) {
    throw new Error("Failed to fetch patients");
  }
  return response.json();
}

export async function getPatientById(id) {
  const response = await fetch(`${BASE_URL}/patients/${id}`);
  if (!response.ok) {
    throw new Error("Failed to fetch patient");
  }
  return response.json();
}

export async function createPatient(patientData) {
  const response = await fetch(`${BASE_URL}/patients`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(patientData)
  });

  if (!response.ok) {
    throw new Error("Failed to create patient");
  }

  return response.json();
}

export async function updatePatient(id, patientData) {
  const response = await fetch(`${BASE_URL}/patients/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(patientData)
  });

  if (!response.ok) {
    throw new Error("Failed to update patient");
  }

  return response.json();
}

export async function deletePatient(id) {
  const response = await fetch(`${BASE_URL}/patients/${id}`, {
    method: "DELETE"
  });

  if (!response.ok) {
    throw new Error("Failed to delete patient");
  }

  return response.json();
}
