import pool from "../db/connection.js";

export async function findAll() {
  const [rows] = await pool.query(`
    SELECT
      s.StaffID,
      s.StaffFirstname,
      s.StaffLastname,
      s.StaffRoleID,
      s.StaffClinicID,
      r.RoleName AS StaffRole,
      c.ClinicName AS StaffClinic
    FROM staff s
    JOIN roles r ON s.StaffRoleID = r.RoleID
    JOIN clinics c ON s.StaffClinicID = c.ClinicID
    ORDER BY s.StaffID DESC
  `);
  return rows;
}

export async function findById(id) {
  const [rows] = await pool.query(`
    SELECT
      s.StaffID,
      s.StaffFirstname,
      s.StaffLastname,
      s.StaffRoleID,
      s.StaffClinicID,
      r.RoleName AS StaffRole,
      c.ClinicName AS StaffClinic
    FROM staff s
    JOIN roles r ON s.StaffRoleID = r.RoleID
    JOIN clinics c ON s.StaffClinicID = c.ClinicID
    WHERE s.StaffID = ?
  `, [id]);
  return rows[0] || null;
}

export async function create(staff) {
  const { StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID } = staff;

  const [result] = await pool.query(
    `
      INSERT INTO staff
      (StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID)
      VALUES (?, ?, ?, ?)
    `,
    [StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID]
  );

  return findById(result.insertId);
}

export async function update(id, staff) {
  const { StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID } = staff;

  const [result] = await pool.query(
    `
      UPDATE staff
      SET StaffFirstname = ?, StaffLastname = ?, StaffRoleID = ?, StaffClinicID = ?
      WHERE StaffID = ?
    `,
    [StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  return findById(id);
}

export async function remove(id) {
  const [result] = await pool.query("DELETE FROM staff WHERE StaffID = ?", [id]);
  return result.affectedRows > 0;
}
