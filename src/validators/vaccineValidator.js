export function validateVaccine(req, res, next) {
  const { VaccineName, VaccineCost } = req.body;

  if (!VaccineName || VaccineCost === undefined) {
    return res.status(400).json({ message: "Vaccine name and cost are required" });
  }

  if (typeof VaccineCost !== "number" || VaccineCost < 0) {
    return res.status(400).json({ message: "Vaccine cost must be a valid positive number" });
  }

  next();
}
