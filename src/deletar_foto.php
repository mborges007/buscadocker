<?php
session_start();
include 'db.php';

// Verifica se o usuário está autenticado
if (!isset($_SESSION['id_profissional'])) {
    header("Location: login.php"); // Redireciona para a página de login se não estiver autenticado
    exit;
}

var_dump($_POST); // Para ver o conteúdo do array $_POST


// Obtém o ID do profissional logado
$id_profissional_logado = $_SESSION['id_profissional'];

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['id_foto'])) {
    $id_foto = $_POST['id_foto'];  // Obtém o ID da foto a ser deletada

    // Depuração: verificar se o ID da foto está sendo passado corretamente
    var_dump($id_foto);

    try {
        // Consulta para pegar o caminho da foto e verificar se ela pertence ao profissional logado
        $sql_foto = "SELECT caminho_foto, fk_profissional_id_profissional FROM fotos_profissionais WHERE id_foto = :id_foto";
        $stmt_foto = $conn->prepare($sql_foto);
        $stmt_foto->bindParam(':id_foto', $id_foto, PDO::PARAM_INT);
        $stmt_foto->execute();

        if ($stmt_foto->rowCount() > 0) {
            // Obter o caminho da foto e o ID do profissional
            $foto = $stmt_foto->fetch(PDO::FETCH_ASSOC);

            // Depuração: verificar se a foto foi encontrada
            var_dump($foto);

            $caminho_foto = $foto['caminho_foto'];
            $foto_id_profissional = $foto['fk_profissional_id_profissional'];

            // Verifica se a foto pertence ao profissional logado
            if ($foto_id_profissional == $id_profissional_logado) {
                // Deletar o arquivo de imagem do servidor
                if (file_exists($caminho_foto)) {
                    unlink($caminho_foto); // Deleta o arquivo
                }

                // Excluir a foto do banco de dados
                $sql_deletar_foto = "DELETE FROM fotos_profissionais WHERE id_foto = :id_foto";
                $stmt_deletar_foto = $conn->prepare($sql_deletar_foto);
                $stmt_deletar_foto->bindParam(':id_foto', $id_foto, PDO::PARAM_INT);
                $stmt_deletar_foto->execute();

                // Redireciona para atualizar a página sem a foto deletada
                header("Location: meuperfil.php");
                exit();
            } else {
                // Caso a foto não pertença ao profissional logado
                echo "Você não tem permissão para excluir esta foto.";
            }
        } else {
            // Caso a foto não seja encontrada
            echo "Foto não encontrada!";
        }
    } catch (PDOException $e) {
        echo "Erro ao tentar excluir a foto: " . $e->getMessage();
    }
}



?>
