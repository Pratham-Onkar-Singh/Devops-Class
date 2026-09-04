const http = require("http");

const port = 8080;

const server = http.createServer((request, response) => {
  response.writeHead(200, { "Content-Type": "text/plain" });
  response.end("Hello World from Docker multi-stage build\n");
});

server.listen(port, "0.0.0.0", () => {
  console.log(`Node.js application is running on port ${port}`);
});

