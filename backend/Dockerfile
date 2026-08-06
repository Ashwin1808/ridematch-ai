# FROM node:22-alpine

# WORKDIR /app

# COPY package*.json ./

# RUN npm install 

# COPY . .

# EXPOSE 5001

# CMD ["npm","start"]

# ---------------------
# Stage 1 - Dependencies
# ---------------------

FROM node:22-alpine AS deps

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev


# # ---------------------
# # Stage 2 - Runtime
# # ---------------------

# FROM node:22-alpine

# WORKDIR /app

# COPY --from=deps /app/node_modules ./node_modules

# COPY . .

# EXPOSE 5001

# CMD ["npm","start"]


# ---------------------
# Stage 2 - Runtime
# ---------------------

FROM node:22-alpine

WORKDIR /app

ENV NODE_ENV=production

COPY --from=deps /app/node_modules ./node_modules

COPY . .

# Create non-root user
RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup

# Give ownership to the application
RUN chown -R appuser:appgroup /app

# Switch to non-root user
USER appuser

EXPOSE 5001

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
CMD wget -qO- http://localhost:5001/health || exit 1

CMD ["npm","start"]