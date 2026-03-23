FROM node:20-alpine

WORKDIR /app

# Copy package files and Prisma schema first (for better caching)
COPY package*.json ./
COPY prisma ./prisma/

# Install dependencies
COPY package*.json ./
COPY prisma ./prisma
COPY prisma.config.ts ./
RUN npm ci

# Generate Prisma client
RUN npx prisma generate

# Copy the rest of the application
COPY . .

# Build TypeScript
RUN npm run build

EXPOSE 3000

# Run migrations, seed, and start the server
CMD ["sh", "-c", "npx prisma migrate deploy && npx prisma db seed && node dist/server.js"]