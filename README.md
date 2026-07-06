# Template Base de Projetos

Repositório-template pessoal para iniciar novos projetos já com uma estrutura de contexto para agentes de IA (Claude Code, OpenCode, Antigravity, etc).

## Como usar

**Opção A — GitHub Template Repository (recomendado)**
1. No GitHub, vá em Settings > Template repository e marque a opção.
2. Ao criar um projeto novo, use o botão "Use this template".

**Opção B — Clonar e rodar o bootstrap**
1. Clone este repositório na pasta do novo projeto.
2. Rode `./scripts/bootstrap.sh`.
3. Responda as perguntas (nome do projeto, descrição, tipo de projeto).
4. Remova a pasta `.git` herdada e inicialize um repositório novo, se necessário.

## Estrutura do contexto IA

```
.ai-context/
├── project/          # Visão geral, roadmap, glossário, modelo de negócio
├── architecture/     # Stack, diagramas, backend, frontend, banco, infra, integrações
├── domain/           # Regras de negócio, entidades, normalização
├── engineering/      # Convenções, testes, segurança, performance, workflows, setup
├── ui/               # Design system, regras de UI, padrões de componentes (se houver UI)
├── agents/           # Perfis especializados para agentes de IA
├── decisions/        # Decisões arquiteturais (ADRs)
├── sessions/         # Continuidade entre sessões de IA
├── tasks/            # Backlog e tarefas concluídas
└── prompts/          # Prompts reutilizáveis (code review, debugging, refactoring)
```

Veja `AGENTS.md` para o guia de leitura e orquestração dos agentes.