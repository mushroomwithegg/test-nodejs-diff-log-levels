const express = require('express')
const app = express()
const port = 5000

console.log(process.env);

app.get('/info', (req, res) => {
    console.log({ message: "log info" });
    console.log(process.env.DB_HOST);
    res.send('console.log! DBHOST' + process.env.DB_HOST)
})

app.get('/warning', (req, res) => {
    console.warn({ message: "log warning" });

    res.send('console.warn!')
})

app.get('/error', (req, res) => {
    console.error({ message: "log error" });

    res.send('console.error!')
})

app.get('/exception', (req, res) => {
    console.log(new Error('Invalid'));

    res.send('Log exception!')
})

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
});
