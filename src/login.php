<?php
session_start();
ob_start(); // Inicia o buffer de saída
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuscAraras Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
    <div class="container-fluid p-0 vh-100 d-flex">
        <!-- Sidebar -->
        <div class="sidebar d-flex flex-column p-3">
            <h1 class="text-light text-left">BuscAraras</h1>
            
            <!-- Botão Início -->
            <a class="btn btn-light no-border mb-2 tamanho" href="index.php">Início</a>
            <h3 class="text-danger text-left">Login</h3>
            
            <!-- Botões de Login e Cadastro -->
            <div class="mt-auto">
                <a class="btn btn-primary w-100 mb-2 " href="login.php">Login</a>
                <a href="cadastro.php" class="btn btn-secondary w-100">Cadastro</a>
            </div>
        </div>                     

        <!-- Main Content -->
        <div class="main-content d-flex justify-content-center align-items-center">
            <div class="card form-card">
                <div class="card-body">
                <h4 class="card-title text-center">Login| <span class="text" style="color: #BF4341;">Profissional</span></h4>
                     <div class="text-center mb-3">
                        <a href="login.php" class="btn btn-primary hoverando" style="background-color: #66888b; border-radius:25px;border-color: #66888b">Login Profissional</a>
                        <a href="login_usuario.php"class="btn btn-primary hoverando" style="background-color: #66888b; border-radius:25px;border-color: #66888b">Login Usuário</a>
                    </div>
                    <form action="processa_login.php" method="POST"> <!-- Ação do formulário -->
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email_profissional" required placeholder="Digite seu email">
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha</label>
                            <input type="password" class="form-control" id="senha" name="senha_profissional" required placeholder="Máx. 8">
                        </div>
                        <div class="btn-container">
                            <button type="submit" class="btn btn-success hoverando btn-sm btn-block">Entrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
