# AGENTS.md

Este arquivo é o ponto de entrada para qualquer agente de IA (Claude Code, OpenCode, Antigravity, etc.) trabalhando neste projeto.

## Ordem de leitura recomendada
Antes de propor ou implementar qualquer mudança, leia os arquivos abaixo, nesta ordem, dentro de `.ai-context/`:

1. `00-overview.md` — o que é este projeto e por que ele existe
2. `01-tech-stack.md` — stack técnica e justificativas
3. `02-architecture.md` — arquitetura e principais fluxos
4. `03-conventions.md` — padrões de código, commits e workflow git
5. `04-domain-glossary.md` — termos e conceitos específicos do domínio
6. `decisions/` — decisões arquiteturais já tomadas (ADRs). **Não desfaça uma decisão registrada aqui sem discutir antes.**
7. Se `05-business-model.md` existir e estiver preenchido, leia-o também antes de sugerir ou priorizar features — ele contém o modelo de negócio do projeto. Se estiver marcado como "N/A", ignore.

## Antes de codar
- Consulte `.ai-context/tasks/backlog.md` para saber o que está em andamento.
- Consulte `.ai-context/setup.md` para saber como rodar o projeto localmente.
- Ao concluir uma tarefa, mova o item correspondente de `backlog.md` para `done.md`.

## Prompts reutilizáveis
A pasta `.ai-context/prompts/` contém instruções padronizadas para tarefas recorrentes (revisão de código, debugging, refatoração). Use-as como referência de estilo ao executar essas tarefas.