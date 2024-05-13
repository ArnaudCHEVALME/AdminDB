# Instructions

1. Set environnements variables
```bash
cp .env.template .env
nano .env
```

2. Launch the database
```bash
docker compose up -d && docker compose logs -f
```