import * as appointmentModel from "../models/appointmentModel.js";

export async function getAllAppointments(req, res) {
  try {
    const appointments = await appointmentModel.findAll();
    res.json(appointments);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch appointments" });
  }
}

export async function getAppointmentById(req, res) {
  try {
    const appointment = await appointmentModel.findById(req.params.id);

    if (!appointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    res.json(appointment);
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch appointment" });
  }
}

export async function createAppointment(req, res) {
  try {
    const newAppointment = await appointmentModel.create(req.body);
    res.status(201).json(newAppointment);
  } catch (error) {
    res.status(500).json({ message: "Failed to create appointment" });
  }
}

export async function updateAppointment(req, res) {
  try {
    const updatedAppointment = await appointmentModel.update(req.params.id, req.body);

    if (!updatedAppointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    res.json(updatedAppointment);
  } catch (error) {
    res.status(500).json({ message: "Failed to update appointment" });
  }
}

export async function deleteAppointment(req, res) {
  try {
    const deleted = await appointmentModel.remove(req.params.id);

    if (!deleted) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: "Failed to delete appointment" });
  }
}
