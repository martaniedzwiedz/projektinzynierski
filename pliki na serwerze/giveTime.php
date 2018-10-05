<?php
$servername = "localhost:3306"; //Adres serwera MySQL  
$username = "userdb"; //Nazwa konta użytkownika MySQL
$password = "ijUg52$5"; //Hasło do konta użytkownika MySQL
$dbname = "db"; //Nazwa bazy danych

$conn = new mysqli($servername, $username, $password, $dbname); //Utworzenie połączenia z MySQL

if ($conn->connect_error) { //Sprawdzenie połączenia z MySQL
    die("Connection failed: " . $conn->connect_error); //Wyświetlenie informacji o problemie z połączeniem
}


$IP= $_GET["a"]; //Odebranie danych wysłanych przez ESP

$sql = "SELECT sniadanie_dawka, sniadanie_godzina, obiad_dawka, obiad_godzina, kolacja_dawka, kolacja_godzina FROM podajniki WHERE podajniki_const='$IP'";
$result=$conn->query($sql);

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    //  echo "sniadanie_dawka: " . $row["sniadanie_dawka"]. " sniadanie_godzina: " . $row["sniadanie_godzina"]. " obiad_dawka: " . $row["obiad_dawka"]. " obiad_godzina: " . $row["obiad_godzina"]. "- kolacja_dawka: " . $row["kolacja_dawka"]. "- kolacja_godzina: " . $row["kolacja_godzina"]."<br>";
    echo json_encode($row);
  }
} else {
  echo "0 results";
}


$conn->close(); //Zamknięcie połączenia z MySQL

?>
