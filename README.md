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

3. Access the applications:

NestJS: http://localhost:3000

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

6. Push the database schema to the development database:

```bash
pnpm prisma db push
```

7. Run the backend server on http://localhost:3000 in development mode:

```bash
pnpm start:dev
```

To run the backend tests manually:

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
