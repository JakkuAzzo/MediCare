import * as staffModel from "../models/staffModel.js";

export async function getAllStaff(req, res) {
  try {
    const staff = await staffModel.findAll();
    res.json(staff);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch staff" });
  }
}

export async function getStaffById(req, res) {
  try {
    const staff = await staffModel.findById(req.params.id);

    if (!staff) {
      return res.status(404).json({ message: "Staff member not found" });
    }

    res.json(staff);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch staff member" });
  }
}

export async function createStaff(req, res) {
  try {
    const newStaff = await staffModel.create(req.body);
    res.status(201).json(newStaff);
  } catch (error) {
    res.status(500).json({ message: "Failed to create staff" });
  }
}

export async function updateStaff(req, res) {
  try {
    const updatedStaff = await staffModel.update(req.params.id, req.body);

    if (!updatedStaff) {
      return res.status(404).json({ message: "Staff member not found" });
    }

    res.json(updatedStaff);
  } catch (error) {
    res.status(500).json({ message: "Failed to update staff" });
  }
}

export async function deleteStaff(req, res) {
  try {
    const deleted = await staffModel.remove(req.params.id);

    if (!deleted) {
      return res.status(404).json({ message: "Staff member not found" });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: "Failed to delete staff" });
  }
}
