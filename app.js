const express = require('express');
const https = require('https');
const fs = require('fs');
const path = require('path');

const app = express();


// Configuración de opciones HTTPS
const httpsOptions = {
    key: fs.readFileSync(path.join(__dirname, 'certs/server.key')),
    cert: fs.readFileSync(path.join(__dirname, 'certs/server.crt')),
    ca: fs.readFileSync(path.join(__dirname, 'certs/ca.crt')),
    requestCert: true, // Requerir certificado de cliente
    rejectUnauthorized: true // Rechazar certificados no autorizados
};

// Middleware para parsear JSON
app.use(express.json());

// Ruta de ejemplo
app.get('/api/test', (req, res) => {
    res.json({ 
        message: 'API segura funcionando',
        client: req.socket.getPeerCertificate()
    });
});

// Crear servidor HTTPS
const server = https.createServer(httpsOptions, app);

// Iniciar servidor
const PORT = 3000;
server.listen(PORT, () => {
    console.log(`Servidor HTTPS ejecutándose en puerto ${PORT}`);
}); 