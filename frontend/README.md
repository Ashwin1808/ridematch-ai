# RideMatch AI Frontend

Next.js 16 App Router frontend for RideMatch AI. The application provides the vehicle catalogue, AI recommendation form, detail pages, comparison view, favorites, authentication screens, and fuel calculator.

See the [root README](../README.md) for the full project documentation, architecture diagrams, API reference, and deployment guide.

## Local development

```bash
npm ci
printf 'NEXT_PUBLIC_API_URL=http://localhost:5001\n' > .env.local
npm run dev
```

Open `http://localhost:3000`.

## Scripts

```bash
npm run dev    # start the development server
npm run build  # create a production build
npm start      # run the production server
npm run lint   # run ESLint
```

## Environment

| Variable | Description |
| --- | --- |
| `NEXT_PUBLIC_API_URL` | Public base URL of the Express backend. Embedded at build time, so rebuild the container after changing it. |

## Docker

```bash
docker build \
  --build-arg NEXT_PUBLIC_API_URL=http://localhost:5001 \
  -t ridematch-frontend \
  .
```

The Docker image uses Next.js standalone output and runs as a non-root user.
