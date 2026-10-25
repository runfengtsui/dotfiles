set -x ANTHROPIC_BASE_URL https://api.deepseek.com/anthropic
set -x ANTHROPIC_AUTH_TOKEN <your DeepSeek API key>
set -x ANTHROPIC_MODEL deepseek-flash[1m]
set -x ANTHROPIC_DEFAULT_OPUS_MODEL deepseek-flash[1m]
set -x ANTHROPIC_DEFAULT_SONNET_MODEL deepseek-flash[1m]
set -x ANTHROPIC_DEFAULT_HAIKU_MODEL deepseek-flash
set -x CLAUDE_CODE_SUBAGENT_MODEL deepseek-flash
set -x CLAUDE_CODE_EFFORT_LEVEL max
set -x CLAUDE_CODE_AUTO_COMPACT_WINDOW 786432
