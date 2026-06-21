const express = require("express");
const path = require("path");
const db = require("./db");

const app = express();

app.use(express.json());
app.use(express.static(path.join(__dirname, "../public")));

app.get("/api/vehicles", async (req, res) => {
  try {
    const [vehicles] = await db.query(`
      SELECT
        v.vin,
        v.make,
        v.model,
        v.year,
        v.price,
        v.mileage,
        (
          SELECT vi.ImageURL
          FROM VehicleImages vi
          WHERE vi.vin = v.vin
          ORDER BY vi.SortOrder
          LIMIT 1
        ) AS MainImage
      FROM Vehicle v
      ORDER BY v.year ASC
      LIMIT 50
    `);

    res.json(vehicles);
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({ error: "Could not load vehicles" });
  }
});

app.get("/api/vehicles/:vin", async (req, res) => {
  try {
    const vin = req.params.vin;
    const [vehicleRows] = await db.query(
      `
      SELECT
        vin,
        mileage,
        combined_mpg, 
        year,
        make,
        model,
        trim,
        price,
        color,
        horsepower,
        cylinder_count,
        city_mpg,
        highway_mpg,
        automatic
      FROM vehicle
      WHERE vin = ?
      LIMIT 1
      `,
      [vin]
    );

    if (vehicleRows.length == 0){
      return res.status(404).json({ error: "Vehicle not found" });
    }

    const [imageRows] = await db.query(
      `
      SELECT
        ImageUrl,
        SortOrder AS sortOrder
      FROM VehicleImages
      WHERE vin = ?
      ORDER BY SortOrder
      `,
      [vin]
    );
    
    res.json({
      vehicle: vehicleRows[0],
      images: imageRows
    });
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({ error: "Could not load vehicle details"})
  }
});

app.listen(3000, () => {
  console.log("Server running at http://localhost:3000");
});

app.get("/api/Vehicle/:id/images", async (req, res) => {
  try {
    const vehicleVIN = req.params.id;

    const [images] = await db.query(
      `
       Select ImageID, ImageURL, SortOrder
       FROM VehicleImages
       WHERE vin = ?
       ORDER by SortOrder
      `,
      [vehicleVIN]
    );
    res.json(images);
  } catch (error) {
    console.error("Database error:", error);
    res.status(500).json({ error: "Could not load vehicle images"})
  }
});