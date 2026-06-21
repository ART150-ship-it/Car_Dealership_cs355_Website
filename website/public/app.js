let currentImages = []
let currentImageIndex = 0;
let allVehicles = [];

async function loadVehicles() {
  const vehicleList = document.querySelector('#vehicle-list');

  try{
    const response = await fetch("/api/vehicles");
    const vehicles = await response.json();

    allVehicles = vehicles;

    renderVehicles();
  } catch (error) {
      console.error(error);
      vehicleList.innerHTML = "<p>Could not load vehicles.</p>";
  }
}

function renderVehicles() {
  const vehicleList = document.querySelector("#vehicle-list");
  const sortValue = document.querySelector("#sort-select").value;
  const maxPrice = document.querySelector("#max-price").value;
  const minYear = document.querySelector("#min-year").value;

  let vehiclesToShow = [...allVehicles];

  if (maxPrice) {
    vehiclesToShow = vehiclesToShow.filter(vehicle =>
      Number(vehicle.price) <= Number(maxPrice)
    );
  }

  if (minYear) {
    vehiclesToShow = vehiclesToShow.filter(vehicle =>
      Number(vehicle.year) >= Number(minYear)
    );
  }

  vehiclesToShow.sort((a, b) => {
    if (sortValue === "year-asc") {
      return Number(a.year) - Number(b.year);
    }

    if (sortValue === "year-desc") {
      return Number(b.year) - Number(a.year);
    }

    if (sortValue === "price-asc") {
      return Number(a.price) - Number(b.price);
    }

    if (sortValue === "price-desc") {
      return Number(b.price) - Number(a.price);
    }

    return 0;
  });

  if (vehiclesToShow.length === 0) {
    vehicleList.innerHTML = "<p>No vehicles match your filters.</p>";
    return;
  }

  vehicleList.innerHTML = vehiclesToShow.map(vehicle => `
    <article class="vehicle-card" onclick="openVehicleModal('${vehicle.vin}')">
      <img
        src="${vehicle.MainImage || '/images/Vehicle/missing.jpg'}"
        alt="${vehicle.year} ${vehicle.make} ${vehicle.model}"
        class="vehicle-image"
      >

      <div class="vehicle-info">
        <h2>${vehicle.year} ${vehicle.make} ${vehicle.model}</h2>
        <p><strong>Price:</strong> $${Number(vehicle.price).toLocaleString()}</p>
        <p><strong>Mileage:</strong> ${Number(vehicle.mileage).toLocaleString()}</p>
      </div>
    </article>
  `).join("");
}

async function openVehicleModal(vin) {
  try {
    const response = await fetch(`/api/vehicles/${vin}`);

    if (!response.ok) {
      throw new Error("Could not load vehicle details");
    }

    const data = await response.json();
    const vehicle = data.vehicle;
    const images = data.images;

    currentImages = images.length > 0
      ? images
      : [{ imageUrl: "/images/Vehicle/missing.jpg"}];

      currentImageIndex = 0;

    document.querySelector('#modal-info').innerHTML = `
      <h2>${vehicle.year} ${vehicle.make} ${vehicle.model}</h2>
      <div class="details-grid">
        <div class="detail-item">
          <span class="detail-label">Price:</span>
          <span class="detail-value">$${Number(vehicle.price).toLocaleString()}</span>
        </div>

      <div class="detail-item">
        <span class="detail-label">Mileage:</span>
        <span class="detail-value">${Number(vehicle.mileage).toLocaleString()} miles</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">Color:</span>
        <span class="detail-value">${vehicle.color || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">VIN:</span>
        <span class="detail-value">${vehicle.vin || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">Combined MPG:</span>
        <span class="detail-value">${vehicle.combined_mpg || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">City MPG:</span>
        <span class="detail-value">${vehicle.city_mpg || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">Highway MPG:</span>
        <span class="detail-value">${vehicle.highway_mpg || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">Trim:</span>
        <span class="detail-value">${vehicle.trim || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">Horsepower:</span>
        <span class="detail-value">${vehicle.horsepower || "N/A"}</span>
      </div>

      <div class="detail-item">
        <span class="detail-label">Cylinder Count:</span>
        <span class="detail-value">${vehicle.cylinder_count || "N/A"}</span>
      </div>

    </div>
    `;

    updateModalImage();
    document.querySelector("#vehicle-modal").classList.remove("hidden");
  } catch (error) {
    console.error(error);
    alert("Could not load vehicle details.");
  }
}

function updateModalImage(){
  const modalImage = document.querySelector("#modal-image");
  const image = currentImages[currentImageIndex];

  modalImage.src = image.ImageUrl;
}

function showNextImage(){
  if(currentImages.length == 0) return;

  currentImageIndex++;

  if(currentImageIndex >= currentImages.length){
    currentImageIndex = 0;
  }

  updateModalImage();
}

function showPreviousImage() {
  if (currentImages.length === 0) return;

  currentImageIndex--;

  if (currentImageIndex < 0) {
    currentImageIndex = currentImages.length - 1;
  }

  updateModalImage();
}

function closeVehicleModal() {
  document.querySelector("#vehicle-modal").classList.add("hidden");
}

document.querySelector("#modal-close").addEventListener("click", closeVehicleModal);
document.querySelector("#next-image").addEventListener("click", showNextImage);
document.querySelector("#prev-image").addEventListener("click", showPreviousImage);

document.querySelector("#vehicle-modal").addEventListener("click", event => {
  if (event.target.id === "vehicle-modal") {
    closeVehicleModal();
  }
});

document.addEventListener("keydown", event => {
  const modal = document.querySelector("#vehicle-modal");

  if (modal.classList.contains("hidden")) return;

  if (event.key === "Escape") {
    closeVehicleModal();
  }

  if (event.key === "ArrowRight") {
    showNextImage();
  }

  if (event.key === "ArrowLeft") {
    showPreviousImage();
  }
});

document.querySelector("#sort-select").addEventListener("change", renderVehicles);
document.querySelector("#max-price").addEventListener("input", renderVehicles);
document.querySelector("#min-year").addEventListener("input", renderVehicles);

document.querySelector("#clear-filters").addEventListener("click", () => {
  document.querySelector("#sort-select").value = "year-asc";
  document.querySelector("#max-price").value = "";
  document.querySelector("#min-year").value = "";

  renderVehicles();
});

loadVehicles();