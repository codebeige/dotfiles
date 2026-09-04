alias claude-local='ANTHROPIC_BASE_URL=http://localhost:11434 ANTHROPIC_AUTH_TOKEN=ollama ANTHROPIC_API_KEY="" CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 API_TIMEOUT_MS=1800000 claude --bare'
alias maud='claude-local --model devstral-small-2:24b'
alias gwen='claude-local --model qwen3.6:27b-coding-mxfp8'
alias gwyn='claude-local --model qwen3.6:27b-mlx'
