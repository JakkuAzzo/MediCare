const BASE_URL = "http://localhost:3000/api";

export async function getAppointments() {
  const response = await fetch(`${BASE_URL}/appointments`);
  if (!response.ok) {
    throw new Error("Failed to fetch appointments");
  }
  return response.json();
}

export async function getAppointmentById(id) {
  const response = await fetch(`${BASE_URL}/appointments/${id}`);
  if (!response.ok) {
    throw new Error("Failed to fetch appointment");
  }
  return response.json();
}

export async function createAppointment(appointmentData) {
  const response = await fetch(`${BASE_URL}/appointments`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(appointmentData)
  });

  if (!response.ok) {
    throw new Error("Failed to create appointment");
  }

  return response.json();
}

export async function updateAppointment(id, appointmentData) {
  const response = await fetch(`${BASE_URL}/appointments/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(appointmentData)
  });

  if (!response.ok) {
    throw new Error("Failed to update appointment");
  }

  return response.json();
}

export async function deleteAppointment(id) {
  const response = await fetch(`${BASE_URL}/appointments/${id}`, {
    method: "DELETE"
  });

  if (!response.ok) {
    throw new Error("Failed to delete appointment");
  }

  return response.json();
}
