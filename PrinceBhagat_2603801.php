<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

if(isset($_GET['city'])) {
    $city = $_GET['city'];
} else {
    $city = 'North Lanarkshire';
}

$host = 'localhost';
$username = 'root';
$password = '';

$conn = mysqli_connect($host, $username, $password);
if(!$conn) {
    die('Connecting Unsuccessful: '.mysqli_connect_error());
}

$database = "weather;

mysqli_select_db($conn, $database);

/* CREATING TABLE  */
$create_table = "CREATE TABLE IF NOT EXISTS weather_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    temperature FLOAT NOT NULL,
    weather_condition VARCHAR(100) NOT NULL,
    weather_description VARCHAR(100) NOT NULL,
    humidity INT NOT NULL,
    wind_speed FLOAT NOT NULL,
    wind_deg INT NOT NULL,
    pressure INT NOT NULL,
    icon VARCHAR(20) NOT NULL,
    timezone INT NOT NULL,
    dt INT NOT NULL,
    weather_date DATE NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY date_city (city, weather_date)
)";
$table = mysqli_query($conn, $create_table);

$todaydate = date('Y-m-d');
$select = "SELECT * FROM weather_data WHERE city LIKE '%$city%' AND weather_date='$todaydate'";
$result = mysqli_query($conn, $select);
$result = mysqli_query($conn, $select);
$update = true;
$apikey = "YOUR API KEY";
if(mysqli_num_rows($result) > 0){
    $existing = mysqli_fetch_assoc($result);
    $lastUpdated = strtotime($existing['last_updated']);
    $currentTime = time();
    if($currentTime - $lastUpdated < 7200){
        $update = false;
        $weather_data = $existing;
    }
}
if($update) {
    $data = @file_get_contents(
        'https://api.openweathermap.org/data/2.5/weather?q=' . urlencode($city) .
        '&appid=' . $apikey . '&units=metric'
    );

    $decode_data = json_decode($data, true);
    
    if(isset($decode_data['main'])){
    $cityName  = $decode_data['name'];
    $country   = $decode_data['sys']['country'];
    $temp      = $decode_data['main']['temp'];
    $condition = $decode_data['weather'][0]['main'];
    $description = $decode_data['weather'][0]['description'];
    $humidity  = $decode_data['main']['humidity'];
    $windSpeed = $decode_data['wind']['speed'];
    $windDeg   = $decode_data['wind']['deg'];
    $pressure  = $decode_data['main']['pressure'];
    $icon      = $decode_data['weather'][0]['icon'];
    $timezone = $decode_data['timezone'];
    $dt = $decode_data['dt'];

   $insert_data = "INSERT INTO weather_data
(city, country, temperature, weather_condition, weather_description, humidity, wind_speed, wind_deg, pressure, icon, timezone, dt, weather_date)
VALUES
('$cityName', '$country', $temp, '$condition', '$description', $humidity, $windSpeed, $windDeg, $pressure, '$icon', $timezone, $dt, '$todaydate')
ON DUPLICATE KEY UPDATE 
city='$cityName', country='$country', temperature=$temp, weather_condition='$condition', weather_description='$description', humidity=$humidity, wind_speed=$windSpeed, wind_deg=$windDeg, pressure=$pressure,
icon='$icon', timezone=$timezone, dt=$dt, weather_date='$todaydate', last_updated=CURRENT_TIMESTAMP";


    mysqli_query($conn, $insert_data);
    } else{
        echo json_encode(["error" => "City not found"]);
        exit;
    }
}

/* FETCHING JSONDATA */
$result = mysqli_query($conn, $select);
$weather_data = [];
if(mysqli_num_rows($result) > 0){
    $weather_data = mysqli_fetch_assoc($result);
}
/* RETURNING JSONDATA */
if(!empty($weather_data)){
    echo json_encode(['weather' => $weather_data]);
}

mysqli_close($conn);
?>
