# 0002 — Reestruturação IA-first concluída

## Contexto
O template já vinha sendo construído como projeto IA-first, com `AGENTS.md` curto (entry point) e `.ai-context/` modular. Um prompt reutilizável em `.ai-context/prompts/restructure-project.md` descrpia a estrutura-alvo. Foi solicitada uma passagem de reestruturação para garantir aderência total a esse prompt.

## Problema
Apesar da estrutura geral alinhada, o template ainda apresentava lacunas em relação ao checklist do `restructure-project.md`:
- camada `ui/` não existia (sem `design-system.md`, `ui-rules.md`, `component-standards.md`)
- `AGENTS.md` e `agents/ui-designer.md` não referenciavam `ui/`
- `.editorconfig` não preservava trailing whitespace em Markdown
- `.prettierrc` divergia dos padrões recomendados (`semi: true`, `arrowParens: always`, `printWidth: 100`)
- `.vscode/settings.json` sem `typescript.tsdk`, `files.insertFinalNewline` e `codeActionsOnSave` para ESLint
- `.nvmrc` apontava para `lts/iron` (Node 20) em vez da LTS ativa (`lts/jod`, Node 22)
- `docs/CONTRIBUTING.md` ambíguo quanto à branch base ("`main` ou `dev`")
- ausência de ADR registrando as decisões estruturais

## Decisão
Aplicar a reestruturação completa conforme o prompt, alinhando o template ao checklist:
- criar `.ai-context/ui/` com `design-system.md`, `ui-rules.md`, `component-standards.md` (placeholders comentados, já que o template é genérico)
- adicionar `ui/` à ordem de leitura do `AGENTS.md` e ao contexto do `agents/ui-designer.md` e `agents/frontend-engineer.md`
- alinhar `.editorconfig` (regra `[*.md]`), `.prettierrc` (`semi: false`, `arrowParens: avoid`, `printWidth: 120`) e `.vscode/settings.json` (`typescript.tsdk`, `files.insertFinalNewline`, `codeActionsOnSave`)
- atualizar `.nvmrc` para `lts/jod`
- normalizar `docs/CONTRIBUTING.md` para branch única `main`, removendo a ambiguidade "ou `dev`"
- atualizar tree ASCII do `README.md` para incluir `ui/`
- arquivar `prompts/restructure-project.md` em `decisions/` como ADR (prompt de tarefa não é conhecimento persistente)

## Consequências
**Positivas**
+ Template agora adere integralmente ao checklist de reestrutura IA-first
+ Camada `ui/` isola decisões visuais da implementação técnica (`architecture/frontend.md`)
+ Configs raiz consistentes entre si e com `engineering/conventions.md`, reduzindo drift
+ Branch base única (`main`) elimina fonte comum de bugs de CI em ambientes IA-first
+ `.nvmrc` aponta para LTS ativa, evitando versões EOL

**Negativas**
- `ui/` com placeholders adiciona arquivos que projetos sem UI precisarão apagar manualmente (documentado em nota nos próprios arquivos)
- mudanças em `.prettierrc` (`semi: false`, `arrowParens: avoid`) exigirão reformatar código existente em projetos inicializados a partir do template antes desta reestruturação

## Alternativas consideradas
- **Não criar `ui/` por ser template genérico**: descartado — o prompt recomenda criar quando há decisão visual a cristalizar; placeholders servem como exemplo e guia para projetos derivados
- **Manter `.nvmrc` em `lts/iron`**: descartado — Node 20 aproxima-se do EOL; o prompt exige LTS ativa
- **Deixar `docs/CONTRIBUTING.md` flexível (`main` ou `dev`)**: descartado — inconsistência de branch é a fonte mais comum de bugs de CI segundo o próprio prompt
