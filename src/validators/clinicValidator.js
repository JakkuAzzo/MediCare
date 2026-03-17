export function validateClinic(req, res, next) {
  const {
    ClinicName,
    ClinicAddress,
    ClinicPostcode,
    ClinicContact,
    ClinicManagerID,
    ClinicManagerFirstname,
    ClinicManagerLastname
  } = req.body;

  if (
    !ClinicName ||
    !ClinicAddress ||
    !ClinicPostcode ||
    !ClinicContact ||
    ClinicManagerID === undefined ||
    !ClinicManagerFirstname ||
    !ClinicManagerLastname
  ) {
    return res.status(400).json({ message: "All clinic fields are required" });
  }

  if (typeof ClinicManagerID !== "number" || ClinicManagerID <= 0) {
    return res.status(400).json({ message: "ClinicManagerID must be a valid number" });
  }

  next();
}
