# ======================================================
# Stage 1 - Install Dependencies
# ======================================================

FROM node:22-alpine AS deps

LABEL maintainer="Ashwin"
LABEL project="RideMatch"
LABEL stage="dependencies"

WORKDIR /app

ARG NEXT_PUBLIC_API_URL
ENV NEXT_PUBLIC_API_URL=$NEXT_PUBLIC_API_URL

COPY package*.json ./

RUN npm ci


# ======================================================
# Stage 2 - Build Application
# ======================================================

FROM node:22-alpine AS builder

LABEL maintainer="Ashwin"
LABEL project="RideMatch"
LABEL stage="builder"

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules

COPY . .

RUN npm run build


# ======================================================
# Stage 3 - Production Runner
# ======================================================

FROM node:22-alpine AS runner

LABEL maintainer="Ashwin"
LABEL project="RideMatch"
LABEL version="1.0.0"

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 3000

CMD ["node","server.js"]