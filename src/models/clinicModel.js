import pool from "../db/connection.js";

export async function findAll() {
  const [rows] = await pool.query("SELECT * FROM clinics ORDER BY ClinicID DESC");
  return rows;
}

export async function findById(id) {
  const [rows] = await pool.query("SELECT * FROM clinics WHERE ClinicID = ?", [id]);
  return rows[0] || null;
}

export async function create(clinic) {
  const { ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname } = clinic;

  const [result] = await pool.query(
    `
      INSERT INTO clinics
      (ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    `,
    [ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname]
  );

  return findById(result.insertId);
}

export async function update(id, clinic) {
  const { ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname } = clinic;

  const [result] = await pool.query(
    `
      UPDATE clinics
      SET ClinicName = ?, ClinicAddress = ?, ClinicPostcode = ?, ClinicContact = ?, ClinicManagerID = ?, ClinicManagerFirstname = ?, ClinicManagerLastname = ?
      WHERE ClinicID = ?
    `,
    [ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  return findById(id);
}

export async function remove(id) {
  const [result] = await pool.query("DELETE FROM clinics WHERE ClinicID = ?", [id]);
  return result.affectedRows > 0;
}
