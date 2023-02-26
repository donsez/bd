# Supabase

[Supabase](https://supabase.com/) is an open source Firebase alternative.

## Getting started with Docker

https://supabase.com/docs/guides/self-hosting/docker

```bash
cd github/
mkdir supabase
cd supabase/

# Get the code
git clone --depth 1 https://github.com/supabase/supabase.git

# Go to the docker folder
cd supabase/docker

# Copy the fake env vars
cp .env.example .env

# Start
docker compose up -d

# List containers
docker compose ps

# Show logs
docker compose logs -f
```

Now visit http://localhost:3000 to start using Supabase Studio.


## Supabase CDC Webhooks

https://dzone.com/articles/supabase-cdc-webhooks-to-memphis-rest-gateway
