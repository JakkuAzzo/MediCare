# Travel Jabs Backend

Express.js and MySQL REST API backend for the Travel Jabs web application.

## Module Code

**CIS2006** – Server-Side Web Development Coursework

## Tech Stack

- **Runtime**: Node.js
- **Framework**: Express.js 5.x
- **Database**: MySQL 8.0
- **ORM/Query Builder**: mysql2/promise (native SQL with parameterised queries)
- **Dev Tools**: Nodemon, Prettier

## Project Structure

```
traveljabs-backend/
  src/
    config/           # Configuration files
    controllers/      # Route handlers and business logic
    db/
      connection.js   # MySQL connection pool
    middleware/       # Custom middleware
    models/           # Database query layer
    routes/           # API route definitions
    validators/       # Request validation middleware
    app.js            # Express app setup
    server.js         # Server entry point
  sql/
    schema.sql        # Database schema
    seed.sql          # Seed data
  .env                # Environment variables (not committed)
  .env.example        # Example environment variables
  .gitignore          # Git ignore file
  .prettierrc          # Code formatting config
  package.json        # Dependencies and scripts
  README.md           # This file
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/traveljabs-backend.git
cd traveljabs-backend
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Set Up Environment Variables

Copy `.env.example` to `.env` and update with your local database credentials:

```bash
cp .env.example .env
```

Edit `.env`:

```
PORT=3000
DB_HOST=localhost
DB_PORT=3306
DB_NAME=traveljabs
DB_USER=root
DB_PASSWORD=YOUR_PASSWORD
FRONTEND_URL=http://localhost:5173
```

### 4. Set Up the Database

Using MySQL CLI:

```bash
mysql -u root -p < sql/schema.sql
mysql -u root -p < sql/seed.sql
```

Or manually import using a MySQL client (phpMyAdmin, MySQL Workbench, etc.).

## Running the Project

### Development Server

```bash
npm run dev
```

The server will start on `http://localhost:3000` with auto-reload enabled via Nodemon.

### Production Server

```bash
npm start
```

## Testing Endpoints

### Health Check

```bash
curl http://localhost:3000/api/health
```

Expected response:

```json
{
  "message": "Travel Jabs API is running"
}
```

### Using Postman or Thunder Client

1. **Patients CRUD**
   - `GET /api/patients` – List all patients
   - `GET /api/patients/:id` – Get patient by ID
   - `POST /api/patients` – Create patient
   - `PUT /api/patients/:id` – Update patient
   - `DELETE /api/patients/:id` – Delete patient

2. **Appointments CRUD**
   - `GET /api/appointments` – List all appointments
   - `GET /api/appointments/:id` – Get appointment by ID
   - `POST /api/appointments` – Create appointment
   - `PUT /api/appointments/:id` – Update appointment
   - `DELETE /api/appointments/:id` – Delete appointment

3. **Clinics**
   - `GET /api/clinics` – List all clinics
   - `GET /api/clinics/:id` – Get clinic by ID
   - `POST /api/clinics` – Create clinic
   - `PUT /api/clinics/:id` – Update clinic
   - `DELETE /api/clinics/:id` – Delete clinic

4. **Vaccines**
   - `GET /api/vaccines` – List all vaccines
   - `GET /api/vaccines/:id` – Get vaccine by ID
   - `POST /api/vaccines` – Create vaccine
   - `PUT /api/vaccines/:id` – Update vaccine
   - `DELETE /api/vaccines/:id` – Delete vaccine

5. **Staff**
   - `GET /api/staff` – List all staff
   - `GET /api/staff/:id` – Get staff by ID
   - `POST /api/staff` – Create staff
   - `PUT /api/staff/:id` – Update staff
   - `DELETE /api/staff/:id` – Delete staff

## Request/Response Examples

### Create Patient

**Request:**

```bash
POST /api/patients
Content-Type: application/json

{
  "PatientFirstname": "John",
  "PatientLastname": "Doe",
  "PatientAddress": "123 Main Street",
  "PatientPostcode": "E1 1AA",
  "Patientage": 30
}
```

**Response (201 Created):**

```json
{
  "PatientID": 3,
  "PatientFirstname": "John",
  "PatientLastname": "Doe",
  "PatientAddress": "123 Main Street",
  "PatientPostcode": "E1 1AA",
  "Patientage": 30
}
```

### Create Appointment

**Request:**

```bash
POST /api/appointments
Content-Type: application/json

{
  "AppointmentDatetime": "2026-05-10 15:00:00",
  "AppointmentPatientID": 1,
  "AppointmentClinicID": 1,
  "AppointmentStaffID": 3,
  "AppointmentStatusID": 1
}
```

**Response (201 Created):**

```json
{
  "AppointmentID": 3,
  "AppointmentDatetime": "2026-05-10 15:00:00",
  "AppointmentPatientID": 1,
  "AppointmentClinicID": 1,
  "AppointmentStaffID": 3,
  "AppointmentStatusID": 1,
  "AppointmentPatientFirstname": "Nathan",
  "AppointmentPatientLastname": "Brown",
  "AppointmentClinicName": "Travel Jabs London",
  "AppointmentStaffFirstname": "Emma",
  "AppointmentStaffLastname": "Smith",
  "AppointmentStatusName": "Pending"
}
```

## Database Schema

The database includes these core tables:

- **roles** – Staff roles (Manager, Clinician)
- **clinics** – Vaccination clinic locations
- **staff** – Staff members
- **patients** – Patients
- **status** – Appointment status values
- **vaccines** – Available vaccines
- **appointments** – Patient appointments
- **vaccinations** – Vaccine administration records
- **invoices** – Appointment invoices

See `sql/schema.sql` for full schema definition.

## Validation

The API includes input validation middleware for POST and PUT requests:

- **Patients**: Required fields checked, age must be valid number
- **Appointments**: Required fields checked, IDs must be valid numbers
- **Vaccines**: Name required, cost must be valid positive number

Invalid requests return `400 Bad Request` with error message.

## Code Formatting

Run Prettier to format code:

```bash
npm run format
```

## Deployment

When deploying:

1. Set `NODE_ENV=production` in environment
2. Use production database credentials
3. Update `FRONTEND_URL` to match deployed frontend
4. Ensure MySQL is running and accessible
5. Run migrations if database doesn't exist:

```bash
mysql -u dbuser -p dbname < sql/schema.sql
mysql -u dbuser -p dbname < sql/seed.sql
```

## Troubleshooting

### Connection Error

Check MySQL is running and credentials in `.env` are correct.

### Port Already in Use

Change `PORT` in `.env` or kill the process using the port:

```bash
lsof -i :3000
kill -9 <PID>
```

### Module Not Found

Ensure dependencies are installed:

```bash
npm install
```

## Commit History

Initial commits follow this structure:

1. **Initialise Express backend** – Folder structure, config, entry files
2. **Implement patient CRUD routes, controller, model and validation**
3. **Implement appointment CRUD endpoints and database integration**
4. **Add clinic and vaccine endpoints**

## Notes

- All SQL queries use parameterised statements to prevent SQL injection
- Foreign key relationships are enforced at the database level
- Appointments queries include JOINs to return human-readable names
- Error handling returns appropriate HTTP status codes
- CORS is configured for the frontend URL

## Author

Built for CIS2006 Server-Side Web Development coursework.

## License

ISC
