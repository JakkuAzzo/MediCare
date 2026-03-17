import * as clinicModel from "../models/clinicModel.js";

export async function getAllClinics(req, res) {
  try {
    const clinics = await clinicModel.findAll();
    res.json(clinics);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch clinics" });
  }
}

export async function getClinicById(req, res) {
  try {
    const clinic = await clinicModel.findById(req.params.id);

    if (!clinic) {
      return res.status(404).json({ message: "Clinic not found" });
    }

    res.json(clinic);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch clinic" });
  }
}

export async function createClinic(req, res) {
  try {
    const newClinic = await clinicModel.create(req.body);
    res.status(201).json(newClinic);
  } catch (error) {
    res.status(500).json({ message: "Failed to create clinic" });
  }
}

export async function updateClinic(req, res) {
  try {
    const updatedClinic = await clinicModel.update(req.params.id, req.body);

    if (!updatedClinic) {
      return res.status(404).json({ message: "Clinic not found" });
    }

    res.json(updatedClinic);
  } catch (error) {
    res.status(500).json({ message: "Failed to update clinic" });
  }
}

export async function deleteClinic(req, res) {
  try {
    const deleted = await clinicModel.remove(req.params.id);

    if (!deleted) {
      return res.status(404).json({ message: "Clinic not found" });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: "Failed to delete clinic" });
  }
}
