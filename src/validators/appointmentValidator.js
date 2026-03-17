export function validateAppointment(req, res, next) {
  const { AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID } = req.body;

  if (!AppointmentDatetime || !AppointmentPatientID || !AppointmentClinicID || !AppointmentStaffID || !AppointmentStatusID) {
    return res.status(400).json({ message: "All appointment fields are required" });
  }

  if (typeof AppointmentPatientID !== "number" || typeof AppointmentClinicID !== "number" || typeof AppointmentStaffID !== "number" || typeof AppointmentStatusID !== "number") {
    return res.status(400).json({ message: "IDs must be valid numbers" });
  }

  next();
}
