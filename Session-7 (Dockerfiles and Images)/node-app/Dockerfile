# Stage 1: Prepare the application files
FROM node:20-alpine AS builder
WORKDIR /app
COPY package.json server.js ./

# Stage 2: Run the application in a clean image
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app ./
EXPOSE 8080
CMD ["node", "server.js"]

