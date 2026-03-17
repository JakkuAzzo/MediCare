import pool from "../db/connection.js";

export async function findAll() {
  const [rows] = await pool.query("SELECT * FROM vaccines ORDER BY VaccineID DESC");
  return rows;
}

export async function findById(id) {
  const [rows] = await pool.query("SELECT * FROM vaccines WHERE VaccineID = ?", [id]);
  return rows[0] || null;
}

export async function create(vaccine) {
  const { VaccineName, VaccineCost } = vaccine;

  const [result] = await pool.query(
    `
      INSERT INTO vaccines
      (VaccineName, VaccineCost)
      VALUES (?, ?)
    `,
    [VaccineName, VaccineCost]
  );

  return findById(result.insertId);
}

export async function update(id, vaccine) {
  const { VaccineName, VaccineCost } = vaccine;

  const [result] = await pool.query(
    `
      UPDATE vaccines
      SET VaccineName = ?, VaccineCost = ?
      WHERE VaccineID = ?
    `,
    [VaccineName, VaccineCost, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  return findById(id);
}

export async function remove(id) {
  const [result] = await pool.query("DELETE FROM vaccines WHERE VaccineID = ?", [id]);
  return result.affectedRows > 0;
}
