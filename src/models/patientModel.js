import pool from "../db/connection.js";

export async function findAll() {
  const [rows] = await pool.query("SELECT * FROM patients ORDER BY PatientID DESC");
  return rows;
}

export async function findById(id) {
  const [rows] = await pool.query("SELECT * FROM patients WHERE PatientID = ?", [id]);
  return rows[0] || null;
}

export async function create(patient) {
  const { PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage } =
    patient;

  const [result] = await pool.query(
    `
      INSERT INTO patients
      (PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage)
      VALUES (?, ?, ?, ?, ?)
    `,
    [PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage]
  );

  return findById(result.insertId);
}

export async function update(id, patient) {
  const { PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage } =
    patient;

  const [result] = await pool.query(
    `
      UPDATE patients
      SET PatientFirstname = ?, PatientLastname = ?, PatientAddress = ?, PatientPostcode = ?, Patientage = ?
      WHERE PatientID = ?
    `,
    [PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  return findById(id);
}

export async function remove(id) {
  const [result] = await pool.query("DELETE FROM patients WHERE PatientID = ?", [id]);
  return result.affectedRows > 0;
}
