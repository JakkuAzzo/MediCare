import * as vaccineModel from "../models/vaccineModel.js";

export async function getAllVaccines(req, res) {
  try {
    const vaccines = await vaccineModel.findAll();
    res.json(vaccines);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch vaccines" });
  }
}

export async function getVaccineById(req, res) {
  try {
    const vaccine = await vaccineModel.findById(req.params.id);

    if (!vaccine) {
      return res.status(404).json({ message: "Vaccine not found" });
    }

    res.json(vaccine);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch vaccine" });
  }
}

export async function createVaccine(req, res) {
  try {
    const newVaccine = await vaccineModel.create(req.body);
    res.status(201).json(newVaccine);
  } catch (error) {
    res.status(500).json({ message: "Failed to create vaccine" });
  }
}

export async function updateVaccine(req, res) {
  try {
    const updatedVaccine = await vaccineModel.update(req.params.id, req.body);

    if (!updatedVaccine) {
      return res.status(404).json({ message: "Vaccine not found" });
    }

    res.json(updatedVaccine);
  } catch (error) {
    res.status(500).json({ message: "Failed to update vaccine" });
  }
}

export async function deleteVaccine(req, res) {
  try {
    const deleted = await vaccineModel.remove(req.params.id);

    if (!deleted) {
      return res.status(404).json({ message: "Vaccine not found" });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: "Failed to delete vaccine" });
  }
}
