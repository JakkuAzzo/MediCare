import * as patientModel from "../models/patientModel.js";

export async function getAllPatients(req, res) {
  try {
    const patients = await patientModel.findAll();
    res.json(patients);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch patients" });
  }
}

export async function getPatientById(req, res) {
  try {
    const patient = await patientModel.findById(req.params.id);

    if (!patient) {
      return res.status(404).json({ message: "Patient not found" });
    }

    res.json(patient);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch patient" });
  }
}

export async function createPatient(req, res) {
  try {
    const newPatient = await patientModel.create(req.body);
    res.status(201).json(newPatient);
  } catch (error) {
    res.status(500).json({ message: "Failed to create patient" });
  }
}

export async function updatePatient(req, res) {
  try {
    const updatedPatient = await patientModel.update(req.params.id, req.body);

    if (!updatedPatient) {
      return res.status(404).json({ message: "Patient not found" });
    }

    res.json(updatedPatient);
  } catch (error) {
    res.status(500).json({ message: "Failed to update patient" });
  }
}

export async function deletePatient(req, res) {
  try {
    const deleted = await patientModel.remove(req.params.id);

    if (!deleted) {
      return res.status(404).json({ message: "Patient not found" });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: "Failed to delete patient" });
  }
}
