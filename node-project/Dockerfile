# 1. Use official Node image (has node + npm)
FROM node:18

# 2. Set working directory in container
WORKDIR /app
# This means: every command from now runs **inside /app** in the container

# 3. Copy only package.json and package-lock.json first (if available)
COPY package*.json ./
# This lets Docker cache dependencies layer

# 4. Install dependencies
RUN npm install
# This runs **npm install** inside /app — now express gets installed

# 5. Copy rest of your application files
COPY . .
# This includes your app.js and other source files

# 6. Expose the port used by app
EXPOSE 3000

# 7. Define the command to run the app
CMD ["node", "index.js"]

