//search button start
const searchButton = document.querySelector(".search-btn");
const cityInput = document.querySelector(".city-input");
const weatherIcon = document.getElementById("weather-icon");

searchButton.addEventListener("click", () => {
  const cityName = cityInput.value.trim();
  if (!cityName) return alert("Please enter a city name!");
  getWeather(cityName);
});

cityInput.addEventListener("keyup", (e) => {
  if (e.key === "Enter") {
    const cityName = cityInput.value.trim();
    if (!cityName) return alert("Please enter a city name!");
    getWeather(cityName);
  }
});

async function getWeather(city) {
  try {
    let data;

    if (navigator.onLine) {
      let res = await fetch(
        "http://localhost/weatherapp/PrinceBhagat_2603801.php?city=" +
          encodeURIComponent(city)
      );

      if (!res.ok) {
        alert("Cty not found");
        return;
      }

      data = await res.json();
      if (!data.error && data.weather) {
        localStorage.setItem(city, JSON.stringify(data));
      } else {
        alert("Cty not found");
        return;
      }
    } else {
      const cached = localStorage.getItem(city);
      if (!cached) {
        alert("No offline data available for " + city);
        return;
      }
      data = JSON.parse(cached);
    }

    let weather = data.weather;

    document.querySelector(".country-txt").textContent =
      weather.city + ", " + weather.country;

    document.querySelector(".current-date-txt").textContent =
      new Date().toLocaleDateString("en-US", {
        weekday: "short",
        day: "2-digit",
        month: "short",
      });

    document.querySelector(".temp-txt").textContent =
      weather.temperature + "°C";

    document.querySelector(".condition-txt").textContent =
      weather.weather_condition;

    document.querySelector(".humidity-value-txt").textContent =
      weather.humidity + "%";

    document.querySelector(".wind-speed-value-txt").textContent =
      weather.wind_speed + " m/s";

    document.querySelector(".wind-direction-value-txt").textContent =
      weather.wind_deg + "°";

    document.querySelector(".pressure-value-txt").textContent =
      weather.pressure + " hPa";

    weatherIcon.src =
      `https://openweathermap.org/img/wn/${weather.icon}@2x.png`;
    weatherIcon.alt = weather.weather_description;

    document.getElementById("weather-display").classList.remove("hidden");
  } catch (error) {
    alert("Error: " + error.message);
  }
}

//defult location for webpage
getWeather("North Lanarkshire");
