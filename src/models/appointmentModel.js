import pool from "../db/connection.js";

export async function findAll() {
  const [rows] = await pool.query(`
    SELECT
      a.AppointmentID,
      a.AppointmentDatetime,
      a.AppointmentPatientID,
      a.AppointmentClinicID,
      a.AppointmentStaffID,
      a.AppointmentStatusID,
      p.PatientFirstname AS AppointmentPatientFirstname,
      p.PatientLastname AS AppointmentPatientLastname,
      c.ClinicName AS AppointmentClinicName,
      s.StaffFirstname AS AppointmentStaffFirstname,
      s.StaffLastname AS AppointmentStaffLastname,
      st.StatusName AS AppointmentStatusName
    FROM appointments a
    JOIN patients p ON a.AppointmentPatientID = p.PatientID
    JOIN clinics c ON a.AppointmentClinicID = c.ClinicID
    JOIN staff s ON a.AppointmentStaffID = s.StaffID
    JOIN status st ON a.AppointmentStatusID = st.StatusID
    ORDER BY a.AppointmentID DESC
  `);
  return rows;
}

export async function findById(id) {
  const [rows] = await pool.query(`
    SELECT
      a.AppointmentID,
      a.AppointmentDatetime,
      a.AppointmentPatientID,
      a.AppointmentClinicID,
      a.AppointmentStaffID,
      a.AppointmentStatusID,
      p.PatientFirstname AS AppointmentPatientFirstname,
      p.PatientLastname AS AppointmentPatientLastname,
      c.ClinicName AS AppointmentClinicName,
      s.StaffFirstname AS AppointmentStaffFirstname,
      s.StaffLastname AS AppointmentStaffLastname,
      st.StatusName AS AppointmentStatusName
    FROM appointments a
    JOIN patients p ON a.AppointmentPatientID = p.PatientID
    JOIN clinics c ON a.AppointmentClinicID = c.ClinicID
    JOIN staff s ON a.AppointmentStaffID = s.StaffID
    JOIN status st ON a.AppointmentStatusID = st.StatusID
    WHERE a.AppointmentID = ?
  `, [id]);
  return rows[0] || null;
}

export async function create(appointment) {
  const { AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID } = appointment;

  const [result] = await pool.query(
    `
      INSERT INTO appointments
      (AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID)
      VALUES (?, ?, ?, ?, ?)
    `,
    [AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID]
  );

  return findById(result.insertId);
}

export async function update(id, appointment) {
  const { AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID } = appointment;

  const [result] = await pool.query(
    `
      UPDATE appointments
      SET AppointmentDatetime = ?, AppointmentPatientID = ?, AppointmentClinicID = ?, AppointmentStaffID = ?, AppointmentStatusID = ?
      WHERE AppointmentID = ?
    `,
    [AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID, id]
  );

  if (result.affectedRows === 0) {
    return null;
  }

  return findById(id);
}

export async function remove(id) {
  const [result] = await pool.query("DELETE FROM appointments WHERE AppointmentID = ?", [id]);
  return result.affectedRows > 0;
}
