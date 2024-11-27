const express = require('express');
const mysql = require('mysql2');

const app = express();
const path = require('path');

app.get('/', (request, response) => {
    response.sendFile(path.join(__dirname, 'public', 'home.html'));
});

const port = 3000;

// Configuração da conexão com o banco de dados
const db = mysql.createConnection({
    host: 'sql10.freesqldatabase.com',     // Altere se o banco de dados estiver em outro host
    user: 'sql10741875',   // Substitua por seu usuário MySQL
    password: 'kU3kRVEHUb', // Substitua pela sua senha MySQL
    database: 'sql10741875',   // Nome do banco de dados criado
    port: 3306
});

// Conectar ao banco de dados
db.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados:', erro);
        return;
    }
    console.log('Conexão ao banco de dados MySQL bem-sucedida!');
});

// Middleware para parsear JSON
app.use(express.json());

// Rota para obter os produtos do banco de dados
app.get('/produtos', (req, res) => {
    db.query('SELECT * FROM produtos', (err, results) => {
        if (err) {
            res.status(500).send('Erro ao buscar produtos');
            return;
        }
        res.json(results); // Envia os resultados em formato JSON
    });
});

// Rota para adicionar um novo produto
app.post('/produtos', (req, res) => {
    const { nome, preco } = req.body;
    const query = 'INSERT INTO produtos (nome, preco) VALUES (?, ?)';
    db.query(query, [nome, preco], (err, result) => {
        if (err) {
            res.status(500).send('Erro ao inserir produto');
            return;
        }
        res.status(201).send('Produto adicionado com sucesso');
    });
});

    // Rota para excluir um produto
app.delete('/produtos/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM produtos WHERE id = ?';
    db.query(query, [id], (err, result) => {
        if (err) {
            res.status(500).send('Erro ao excluir produto');
            return;
        }
        res.status(200).send('Produto excluído com sucesso');
    });
});

// Servir arquivos estáticos da pasta public
app.use(express.static('public'));

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});


