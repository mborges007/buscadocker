<?php
session_start();
ob_start(); // Inicia o buffer de saída

$host = 'db'; // Nome do serviço definido no docker-compose.yml
$dbname = 'busca';
$username = 'root';
$password = 'rootpassword';
try {
    $conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Verifica se o formulário foi enviado via POST
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email_usuario'];
        $senha = $_POST['senha_usuario'];

        // Busca o profissional pelo email
        $stmt = $conn->prepare("SELECT * FROM usuarios WHERE email_usuario = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

            // Verifica se a senha está correta
            if (password_verify($senha, $usuario['senha_usuario'])) {
                $_SESSION['id_usuario'] = $usuario['id_usuario'];
                header("Location: index.php");
                exit; // Encerra o script após o redirecionamento
            } else {
                echo "<script>alert('Email ou senha incorretos.'); window.location.href='login_usuario.php';</script>";
            }
        } else {
            // Verifica se o email pertence a um usuário (tabela de usuários)
            $stmt_user = $conn->prepare("SELECT * FROM profisional WHERE email_profissional = :email");
            $stmt_user->bindParam(':email', $email);
            $stmt_user->execute();

             
        }
        if (isset($_SESSION['redirect_url'])) {
            $redirect_url = $_SESSION['redirect_url'];
            unset($_SESSION['redirect_url']); // Limpar a URL após o redirecionamento
            header("Location: $redirect_url");
        } else {
            // Se não houver página de origem, redireciona para a página inicial
            header("Location: index.php");
        }
        exit;
        
    }
} catch (PDOException $e) {
    echo "<script>alert('Erro ao conectar com o banco de dados: " . $e->getMessage() . "');</script>";
}
?>