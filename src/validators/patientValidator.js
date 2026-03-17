export function validatePatient(req, res, next) {
  const { PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage } =
    req.body;

  if (!PatientFirstname || !PatientLastname || !PatientAddress || !PatientPostcode) {
    return res.status(400).json({ message: "All patient fields are required" });
  }

  if (typeof Patientage !== "number" || Patientage < 0) {
    return res.status(400).json({ message: "Patient age must be a valid number" });
  }

  next();
}
