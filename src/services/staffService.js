import BASE_URL, { getAuthHeaders } from "../config/api";

export async function getStaff() {
  const response = await fetch(`${BASE_URL}/staff`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch staff: ${response.statusText}`);
  }

  return response.json();
}

export async function getStaffById(id) {
  const response = await fetch(`${BASE_URL}/staff/${id}`, {
    method: "GET",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to fetch staff member: ${response.statusText}`);
  }

  return response.json();
}

export async function createStaff(staffData) {
  const response = await fetch(`${BASE_URL}/staff`, {
    method: "POST",
    headers: getAuthHeaders(),
    body: JSON.stringify(staffData)
  });

  if (!response.ok) {
    throw new Error(`Failed to create staff member: ${response.statusText}`);
  }

  return response.json();
}

export async function updateStaff(id, staffData) {
  const response = await fetch(`${BASE_URL}/staff/${id}`, {
    method: "PUT",
    headers: getAuthHeaders(),
    body: JSON.stringify(staffData)
  });

  if (!response.ok) {
    throw new Error(`Failed to update staff member: ${response.statusText}`);
  }

  return response.json();
}

export async function deleteStaff(id) {
  const response = await fetch(`${BASE_URL}/staff/${id}`, {
    method: "DELETE",
    headers: getAuthHeaders()
  });

  if (!response.ok) {
    throw new Error(`Failed to delete staff member: ${response.statusText}`);
  }

  return response.json();
}
