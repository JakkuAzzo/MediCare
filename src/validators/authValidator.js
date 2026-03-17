const EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

export function validateSignup(req, res, next) {
  const { email, password, firstName, lastName } = req.body;

  if (!email || !password || !firstName || !lastName) {
    return res.status(400).json({
      message: "email, password, firstName and lastName are required"
    });
  }

  if (!EMAIL_REGEX.test(email)) {
    return res.status(400).json({ message: "Please provide a valid email" });
  }

  if (typeof password !== "string" || password.length < 6) {
    return res
      .status(400)
      .json({ message: "Password must be at least 6 characters long" });
  }

  next();
}

export function validateForgotPassword(req, res, next) {
  const { email } = req.body;

  if (!email) {
    return res.status(400).json({ message: "Email is required" });
  }

  if (!EMAIL_REGEX.test(email)) {
    return res.status(400).json({ message: "Please provide a valid email" });
  }

  next();
}

export function validateLogin(req, res, next) {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Email and password are required" });
  }

  if (!EMAIL_REGEX.test(email)) {
    return res.status(400).json({ message: "Please provide a valid email" });
  }

  next();
}
