const BASE_URL = "http://localhost:3000/api";

export async function getStaff() {
  const response = await fetch(`${BASE_URL}/staff`);
  if (!response.ok) {
    throw new Error("Failed to fetch staff");
  }
  return response.json();
}

export async function getStaffById(id) {
  const response = await fetch(`${BASE_URL}/staff/${id}`);
  if (!response.ok) {
    throw new Error("Failed to fetch staff member");
  }
  return response.json();
}

export async function createStaff(staffData) {
  const response = await fetch(`${BASE_URL}/staff`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(staffData)
  });

  if (!response.ok) {
    throw new Error("Failed to create staff member");
  }

  return response.json();
}

export async function updateStaff(id, staffData) {
  const response = await fetch(`${BASE_URL}/staff/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify(staffData)
  });

  if (!response.ok) {
    throw new Error("Failed to update staff member");
  }

  return response.json();
}

export async function deleteStaff(id) {
  const response = await fetch(`${BASE_URL}/staff/${id}`, {
    method: "DELETE"
  });

  if (!response.ok) {
    throw new Error("Failed to delete staff member");
  }

  return response.json();
}
