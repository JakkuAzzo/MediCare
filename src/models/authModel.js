import pool from "../db/connection.js";

export async function ensureUsersTable() {
  await pool.query(`
    CREATE TABLE IF NOT EXISTS users (
      UserID INT AUTO_INCREMENT PRIMARY KEY,
      Email VARCHAR(255) NOT NULL UNIQUE,
      PasswordHash VARCHAR(255) NOT NULL,
      FirstName VARCHAR(100) NOT NULL,
      LastName VARCHAR(100) NOT NULL,
      ResetToken VARCHAR(255),
      ResetTokenExpiresAt DATETIME,
      CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
  `);
}

export async function findUserByEmail(email) {
  const [rows] = await pool.query("SELECT * FROM users WHERE Email = ?", [email]);
  return rows[0] || null;
}

export async function findUserById(userId) {
  const [rows] = await pool.query(
    "SELECT UserID, Email, FirstName, LastName, CreatedAt FROM users WHERE UserID = ?",
    [userId]
  );
  return rows[0] || null;
}

export async function createUser({ email, passwordHash, firstName, lastName }) {
  const [result] = await pool.query(
    `
      INSERT INTO users
      (Email, PasswordHash, FirstName, LastName)
      VALUES (?, ?, ?, ?)
    `,
    [email, passwordHash, firstName, lastName]
  );

  const [rows] = await pool.query(
    "SELECT UserID, Email, FirstName, LastName, CreatedAt FROM users WHERE UserID = ?",
    [result.insertId]
  );

  return rows[0] || null;
}

export async function savePasswordResetToken({ userId, resetToken, resetTokenExpiresAt }) {
  await pool.query(
    `
      UPDATE users
      SET ResetToken = ?, ResetTokenExpiresAt = ?
      WHERE UserID = ?
    `,
    [resetToken, resetTokenExpiresAt, userId]
  );
}
