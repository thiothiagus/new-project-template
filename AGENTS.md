# AGENTS.md

Ponto de entrada para qualquer agente de IA (Claude Code, OpenCode, Antigravity, etc.) trabalhando neste projeto.

## Projeto
{{PROJECT_DESCRIPTION}} — veja `.ai-context/project/overview.md` para detalhes.

## Como os agentes devem operar
1. Leia este arquivo primeiro.
2. Leia `.ai-context/` na ordem recomendada abaixo.
3. Consulte `sessions/current-task.md` para continuidade entre sessões.
4. Ao finalizar uma tarefa, mova-a para `tasks/done.md` (removendo de `tasks/backlog.md` ou `tasks/backlog-dev.md` conforme o caso).
5. Documente decisões relevantes em `decisions/`.

## Ordem de leitura do contexto
1. `project/overview.md` — Visão geral do projeto
2. `project/vision.md` — Visão aspiracional
3. `project/roadmap.md` — Roteiro do projeto
4. `architecture/tech-stack.md` — Stack técnica
   *(se existir `architecture/stack-extra-*.md`, leia após este item)*
5. `architecture/overview.md` — Arquitetura (visão geral)
6. `architecture/backend.md` — Arquitetura do backend
7. `architecture/frontend.md` — Arquitetura do frontend
8. `architecture/database.md` — Modelo de dados
9. `architecture/infrastructure.md` — Infraestrutura
10. `architecture/integrations.md` — Integrações externas
11. `domain/business-rules.md` — Regras de negócio
12. `domain/entities.md` — Entidades de domínio
13. `domain/pricing.md` — Precificação (se aplicável)
14. `domain/normalization.md` — Normalização de dados
15. `engineering/conventions.md` — Convenções de código
16. `engineering/testing.md` — Estratégia de testes
17. `engineering/security.md` — Práticas de segurança
18. `engineering/performance.md` — Metas de performance
19. `engineering/workflows.md` — Workflows de desenvolvimento
20. `engineering/setup.md` — Setup do ambiente
21. `project/glossary.md` — Glossário de domínio
22. `project/business-model.md` — Modelo de negócio (se aplicável)
23. `ui/design-system.md` — Tokens visuais e filosofia (se houver UI)
24. `ui/ui-rules.md` — Regras obrigatórias de interface (se houver UI)
25. `ui/component-standards.md` — Padrões de componentes e acessibilidade (se houver UI)
26. **`AI_RULES.md` — Base de conhecimento de aprendizado contínuo (leia e siga obrigatoriamente)**
27. **`.ai-context/rules/` — Arquivos de regras por domínio (consulte o índice em `AI_RULES.md` para saber qual ler)**
28. `agents/` — Perfis de agentes especializados (consulte conforme seu papel)
29. `decisions/` — Decisões arquiteturais já tomadas

## Regras globais
- Nunca faça commit de segredos (chaves, tokens, senhas).
- Consulte `architecture/`, `domain/` e `project/` antes de sugerir mudanças estruturais.
- Mantenha continuidade entre sessões: leia e atualize `sessions/current-task.md`.
- Agentes especializados têm perfis em `agents/` — leia o seu antes de começar.
- **Leia `AI_RULES.md` antes de iniciar qualquer tarefa e siga todas as regras registradas.**
- **Ao resolver um problema, atualize o arquivo de regras do domínio correspondente em `.ai-context/rules/` com a lição aprendida (problema, causa raiz, solução, prevenção).**
- **Prioridade de manutenção sobre desenvolvimento:** nenhum agente de IA pode iniciar tarefa de `tasks/backlog-dev.md` (desenvolvimento/novas funcionalidades) enquanto existirem tarefas pendentes em `tasks/backlog.md` (manutenção). As tarefas de manutenção devem ser concluídas primeiro.

## Fluxo de trabalho
1. Leia `AGENTS.md` e o contexto essencial
2. Entenda arquitetura e regras de negócio
3. Verifique decisões anteriores em `decisions/`
4. Verifique o backlog em `tasks/backlog.md` (manutenção) e `tasks/backlog-dev.md` (desenvolvimento)
5. Execute as alterações
6. Atualize `tasks/` e `sessions/current-task.md`

## Prompts reutilizáveis
A pasta `.ai-context/prompts/` contém instruções padronizadas para tarefas recorrentes (revisão de código, debugging, refatoração). Use-as como referência de estilo ao executar essas tarefas.
