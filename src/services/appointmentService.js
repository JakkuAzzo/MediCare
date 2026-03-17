import BASE_URL, { getAuthHeaders } from "../config/api";

export async function getAppointments() {
  const response = await fetch(`${BASE_URL}/appointments`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch appointments: ${response.statusText}`);
  }

  return response.json();
}

export async function getAppointmentById(id) {
  const response = await fetch(`${BASE_URL}/appointments/${id}`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch appointment: ${response.statusText}`);
  }

  return response.json();
}

export async function createAppointment(appointmentData) {
  const response = await fetch(`${BASE_URL}/appointments`, {
    method: "POST",
    headers: getAuthHeaders(),
    body: JSON.stringify(appointmentData)
  });

  if (!response.ok) {
    throw new Error(`Failed to create appointment: ${response.statusText}`);
  }

  return response.json();
}

export async function updateAppointment(id, appointmentData) {
  const response = await fetch(`${BASE_URL}/appointments/${id}`, {
    method: "PUT",
    headers: getAuthHeaders(),
    body: JSON.stringify(appointmentData)
  });

  if (!response.ok) {
    throw new Error(`Failed to update appointment: ${response.statusText}`);
  }

  return response.json();
}

export async function deleteAppointment(id) {
  const response = await fetch(`${BASE_URL}/appointments/${id}`, {
    method: "DELETE",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to delete appointment: ${response.statusText}`);
  }

  return response.json();
}
