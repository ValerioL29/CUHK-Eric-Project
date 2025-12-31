# CUHK-Eric-Project

🚈 - Evaluate MOAR and DocETL

## Project Setup

> The image of my devpod is: nvcr.io/nvidia/cuda-dl-base:25.06-cuda12.9-devel-ubuntu24.04

Install `uv` environment manager and `nodejs` -

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh && \
apt install nodejs npm -y
```

Create a virtual environment for development - 

```bash
# Move to docetl submodule directory
cd docetl && uv venv --no-project -p 3.13 && source .venv/bin/activate
```

Follow the **DocETL** guide to install local development dependencies -

```bash
# Set up environment variables in .env in the root/top-level directory (for the backend Python server):
cat <<< '# Used by DocETL pipeline execution engine
OPENAI_API_KEY=your_api_key_here

# BACKEND configuration
BACKEND_ALLOW_ORIGINS=http://localhost:3000,http://127.0.0.1:3000
BACKEND_HOST=localhost
BACKEND_PORT=8000
BACKEND_RELOAD=True

# FRONTEND configuration
FRONTEND_HOST=0.0.0.0
FRONTEND_PORT=3000

# Host port mapping for docker-compose (if not set, defaults are used in docker-compose.yml)
FRONTEND_DOCKER_COMPOSE_PORT=3031
BACKEND_DOCKER_COMPOSE_PORT=8081

# Supported text file encodings
TEXT_FILE_ENCODINGS=utf-8,latin1,cp1252,iso-8859-1' > .env
# And create an .env.local file in the website directory (for DocWrangler UI features):
cat <<< 'OPENAI_API_KEY=your_api_key_here  # Used by DocETL pipeline execution engine
# BACKEND configuration
BACKEND_ALLOW_ORIGINS=http://localhost:3000,http://127.0.0.1:3000
BACKEND_HOST=localhost
BACKEND_PORT=8000
BACKEND_RELOAD=True

# FRONTEND configuration
FRONTEND_HOST=0.0.0.0
FRONTEND_PORT=3000

# Host port mapping for docker-compose (if not set, defaults are used in docker-compose.yml)
FRONTEND_DOCKER_COMPOSE_PORT=3031
BACKEND_DOCKER_COMPOSE_PORT=8081

# Supported text file encodings
TEXT_FILE_ENCODINGS=utf-8,latin1,cp1252,iso-8859-1' > .env
# And create an .env.local file in the website directory (for DocWrangler UI features):
cat <<< 'OPENAI_API_KEY=sk-xxx  # Used by TypeScript features: improve prompt, chatbot, etc.
OPENAI_API_BASE=https://api.openai.com/v1
MODEL_NAME=gpt-4o-mini  # Model used by the UI assistant

NEXT_PUBLIC_BACKEND_HOST=localhost
NEXT_PUBLIC_BACKEND_PORT=8000
NEXT_PUBLIC_HOSTED_DOCWRANGLER=false' > website/.env.local
# Install dependencies:
uv run pre-commit install
uv sync --all-groups --all-extras --active
uv pip install -r experiments/reasoning/requirements.txt
make install-ui
# Start the development server:
make run-ui-dev
# Visit http://localhost:3000/playground to access the interactive UI.
```

Set up your Azure API credentials (required for LLM calls):

```bash
export AZURE_API_KEY="your_key_here"
export AZURE_API_BASE="your_endpoint_here" 
export AZURE_API_VERSION="your_version_here"
```

Or, you can comment all the Azure prefix and usage in the `litellm.completion` function and use OpenAI APIs:

```bash
export OPENAI_API_KEY="your_key"
```
