export function validateStaff(req, res, next) {
  const { StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID } = req.body;

  if (
    !StaffFirstname ||
    !StaffLastname ||
    StaffRoleID === undefined ||
    StaffClinicID === undefined
  ) {
    return res.status(400).json({ message: "All staff fields are required" });
  }

  if (
    typeof StaffRoleID !== "number" ||
    StaffRoleID <= 0 ||
    typeof StaffClinicID !== "number" ||
    StaffClinicID <= 0
  ) {
    return res
      .status(400)
      .json({ message: "StaffRoleID and StaffClinicID must be valid numbers" });
  }

  next();
}
