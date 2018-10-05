<?php
$servername = "localhost:3306"; //Adres serwera MySQL  
$username = "userdb"; //Nazwa konta użytkownika MySQL
$password = "ijUg52$5"; //Hasło do konta użytkownika MySQL
$dbname = "db"; //Nazwa bazy danych

$conn = new mysqli($servername, $username, $password, $dbname); //Utworzenie połączenia z MySQL

if ($conn->connect_error) { //Sprawdzenie połączenia z MySQL
    die("Connection failed: " . $conn->connect_error); //Wyświetlenie informacji o problemie z połączeniem
}

$stan = $_GET["a"]; //Odebranie danych wysłanych przez ESP
$IP= $_GET["b"]; //Odebranie danych wysłanych przez ESP


$sql = "UPDATE podajniki SET stan='$stan' WHERE podajniki_const='$IP'";


if ($conn->query($sql) === TRUE) { //Sprawdzenie czy dane zostały poprawnie dodane do tabeli
    echo "Rekord zostal dodany poprawnie!"; //Wyświetlenie komunikatu o powodzeniu
} else {
    echo "Error: " . $sql . "<br>" . $conn->error; //Wyświetlenie komunikatu o niepowodzeniu wraz z informacjami na temat błędu
}

$conn->close(); //Zamknięcie połączenia z MySQL
?>
