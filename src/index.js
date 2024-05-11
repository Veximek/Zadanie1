const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000; 

function generateInfoPage(ip, date) {
    return `
        <html>
        <head>
            <title>Informacje o Kliencie</title>
        </head>
        <body>
            <h1>Adres IP Klienta: ${ip}</h1>
            <h2>Data i czas w strefie czasowej klienta: ${date}</h2>
        </body>
        </html>
    `;
}

app.use((req, res, next) => {
    console.log(`Serwer uruchomiony przez: Patryk Sowa`);
    console.log(`Serwer nasłuchuje na porcie: ${PORT}`);
    console.log(`Data uruchomienia: ${new Date().toLocaleString()}`);
    next();
});


app.get('/', (req, res) => {
    const clientIP = req.ip; 
    const clientDate = new Date().toLocaleString(); 
    const infoPage = generateInfoPage(clientIP, clientDate); 
    res.send(infoPage); 
});

app.listen(PORT, () => {
    console.log(`Serwer uruchomiony na porcie ${PORT}`);
});
