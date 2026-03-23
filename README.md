# Express + TypeScript + Prisma API

A minimal REST API built with Express, TypeScript, Prisma, and PostgreSQL.

## Requirements

- Node.js 18+
- npm
- PostgreSQL (local or Docker)

## Quick Start

### Option A: Use Docker Postgres (recommended)

```bash
npm install
cp .env.example .env
npm run docker:db:up
npm run db:migrate
npm run dev
```

### Option B: Use your own Postgres

1) Install dependencies and create env file:

```bash
npm install
cp .env.example .env
```

2) Update `.env` with your DB connection:

```env
DATABASE_URL="postgresql://USER:PASSWORD@HOST:5432/DB_NAME?schema=public"
PORT=3000
```

3) Run migrations and start server:

```bash
npm run db:migrate
npm run dev
```

App URL: `http://localhost:3000`

## Create Migration File First

If you want to generate a migration file before applying it:

```bash
npm run db:migrate:create -- --name your_migration_name
```

Then apply migrations:

```bash
npm run db:migrate
```

## Useful Scripts

- `npm run dev` - Start app in development (`ts-node-dev`)
- `npm run build` - Compile TypeScript to `dist/`
- `npm start` - Run compiled app from `dist/server.js`
- `npm run db:generate` - Generate Prisma client
- `npm run db:migrate:create -- --name <name>` - Create migration files only
- `npm run db:migrate` - Create/apply migration in development
- `npm run db:migrate:deploy` - Apply committed migrations (prod/CI)
- `npm run db:push` - Push schema directly (no migration files)
- `npm run db:reset` - Reset DB and re-run migrations (destructive)
- `npm run db:studio` - Open Prisma Studio
- `npm run db:status` - Show migration status
- `npm run docker:db:up` - Start Postgres container
- `npm run docker:db:down` - Stop Postgres container
- `npm run docker:db:reset` - Remove DB container and volume
- `npm run docker:db:logs` - Follow Postgres logs

## API Endpoints

- `GET /health` -> `{ "status": "OK" }`
- `GET /users` - List users
- `POST /users` - Create user

Example `POST /users` body:

```json
{
  "email": "user@example.com",
  "name": "Jane Doe"
}
```

## Production

```bash
npm run build
npm run db:migrate:deploy
npm start
```

## Common Errors

### `@prisma/client did not initialize yet`

Run:

```bash
npm run db:generate
npm run dev
```

### `Argument "url" is missing in data source block "db"`

- Ensure `.env` exists
- Ensure `DATABASE_URL` is set in `.env`

### Database container issues

```bash
npm run docker:db:logs
npm run docker:db:reset
npm run docker:db:up
```
