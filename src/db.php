<?php
$host = 'db'; // Nome do serviço definido no docker-compose.yml
$dbname = 'busca';
$username = 'root';
$password = 'rootpassword'; // Use a senha que você configurou no docker-compose.yml

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Erro na conexão: ' . $e->getMessage());
}
?>
