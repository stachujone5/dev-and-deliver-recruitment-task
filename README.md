# Dev and Deliver Recruitment Task

### Prerequisites

1. Install [Git](https://git-scm.com/downloads).

2. Install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

3. Install [Node.js](https://nodejs.org/en/download/).

4. Install pnpm globally:

```bash
npm install -g pnpm
```

### Building and Running with Docker Compose

1. Clone the repository:

```bash
git clone https://github.com/stachujone5/dev-and-deliver-recruitment-task.git
```

2. Navigate to the `dev-and-deliver-recruitment-task` directory:

```bash
cd dev-and-deliver-recruitment-task
```

3. Create a `.env` file by copying from the `.env.example` file:

```bash
cp .env.example .env
```

5. Build and start the Docker containers using Docker Compose:

```bash
docker-compose up
```

6. Access the graphql playground at the following URL (The first time you run the app, it will take a a minute or so to start up - we need to fill the database with swapi data):

http://localhost:3000/graphql

### Running the app locally

1. Clone the repository:

```bash
git clone https://github.com/stachujone5/dev-and-deliver-recruitment-task.git
```

2. Navigate to the `dev-and-deliver-recruitment-task` directory:

```bash
cd dev-and-deliver-recruitment-task
```

3. Create a `.env` file by copying from the `.env.example` file:

```bash
cp .env.example .env
```

4. Start the development database by running Docker Compose:

```bash
docker-compose up --build -d db
```

5. Install the dependencies:

```bash
pnpm install
```

6. Change the database host in the `.env` file to `localhost` (instead of `postgres-container`):

```bash
DATABASE_URL=postgresql://prisma:prisma@postgres-container:5432/mydb
into
DATABASE_URL=postgresql://prisma:prisma@localhost:5432/mydb
```

7. Push the database schema to the development database:

```bash
pnpm prisma db push
```

8. Run the graphql playground on http://localhost:3000/graphql in development mode (the first time you run the app, it will take a a minute or so to start up - we need to fill the database with swapi data):

```bash
pnpm start:dev
```

Run the tests:

```bash
pnpm test
```

## Technologies

- NestJS
- Prisma
- PostgreSQL
- Docker
- Docker Compose
- Tested with Jest
