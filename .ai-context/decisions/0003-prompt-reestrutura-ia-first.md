# Reestruturação IA-First do Projeto

Sua tarefa é reorganizar completamente a estrutura de contexto de IA deste projeto para transformá-lo em um projeto verdadeiramente **IA-first**.

Atualmente:

* o arquivo `AGENTS.md` está desorganizado
* a pasta `.ai-context/` está inconsistente
* há mistura de responsabilidades
* o contexto para agentes está pouco modularizado
* decisões técnicas e regras de negócio não estão bem documentadas

Seu objetivo é:

1. analisar a estrutura atual
2. reorganizar os arquivos
3. modularizar o conhecimento
4. criar uma arquitetura de contexto escalável para agentes de IA
5. melhorar a legibilidade tanto para humanos quanto para LLMs
6. reduzir ambiguidades e duplicações
7. transformar o projeto em um ambiente otimizado para desenvolvimento assistido por IA

> **Nota sobre stack:** os exemplos abaixo assumem stack JavaScript/TypeScript (Vite, Vitest, Prettier). Adapte para outras linguagens mantendo a mesma filosofia de modularidade.

---

## Índice

- [Filosofia da Arquitetura](#filosofia-da-arquitetura)
- [1. Reestruturar o `AGENTS.md`](#1-reestruturar-o-agentsmd)
- [2. Reorganizar `.ai-context/`](#2-reorganizar-ai-context)
- [3. Configuração de Ferramentas (raiz do repo)](#3-configuração-de-ferramentas-raiz-do-repo)
- [Regras Importantes](#regras-importantes)
- [Design System e Regras de UI](#design-system-e-regras-de-ui)
- [Decisões Técnicas (ADRs)](#decisões-técnicas-adrs)
- [Agentes Especializados](#agentes-especializados)
- [Contexto Operacional](#contexto-operacional)
- [Fluxo Esperado para Agentes](#fluxo-esperado-para-agentes)
- [Critérios de Qualidade](#critérios-de-qualidade)
- [Sua Tarefa](#sua-tarefa)
- [Checklist de Validação](#checklist-de-validação)

---

# Filosofia da Arquitetura

O projeto deve seguir esta filosofia:

* `AGENTS.md` → camada de orquestração
* `.ai-context/` → base de conhecimento estruturada
* arquivos pequenos e especializados
* contexto modular
* documentação orientada a agentes
* conhecimento persistente do projeto
* fácil navegação para múltiplos agentes

Evite:

* arquivos gigantescos
* duplicação de contexto
* regras espalhadas
* mistura de documentação humana com operacional de IA

---

# 1. Reestruturar o `AGENTS.md`

O arquivo deve:

* ser curto
* atuar como ponto de entrada
* explicar como os agentes devem operar
* apontar quais arquivos devem ser lidos
* conter apenas regras globais e estratégicas

Estrutura esperada:

```md
# AGENTS.md

## Projeto
## Como os agentes devem operar
## Ordem de leitura do contexto
## Regras globais
## Fluxo de trabalho
## Prompts reutilizáveis
```

O `AGENTS.md` NÃO deve:

* conter documentação extensa
* conter regras de negócio detalhadas
* conter arquitetura completa
* virar dump de contexto

---

# 2. Reorganizar `.ai-context/`

Crie uma estrutura modular.

Estrutura recomendada:

```text
.ai-context/
├── project/
│   ├── overview.md          # visão geral descritiva
│   ├── vision.md            # visão aspiracional
│   ├── roadmap.md           # marcos e cronograma
│   ├── glossary.md          # termos de domínio
│   └── business-model.md    # modelo de negócio (opcional)
│
├── architecture/
│   ├── tech-stack.md        # linguagens, frameworks, infra
│   ├── overview.md          # diagramas e visão geral
│   ├── backend.md           # servidor, APIs, padrões (omitir se SPA puro)
│   ├── frontend.md          # UI, estado, componentes
│   ├── database.md          # modelo de dados, migrações (omitir se sem DB)
│   ├── infrastructure.md    # hospedagem, CI/CD, monitoring
│   └── integrations.md      # serviços externos
│
├── domain/
│   ├── business-rules.md    # regras de negócio
│   ├── entities.md          # entidades e relacionamentos (tipos/interfaces)
│   ├── pricing.md           # precificação (se aplicável)
│   └── normalization.md     # padronização de dados
│
├── engineering/
│   ├── conventions.md       # padrões de código e estilo (strict mode, naming, git)
│   ├── testing.md           # estratégia de testes (framework, escopo, padrão de arquivo)
│   ├── security.md          # práticas de segurança (XSS, secrets, localStorage)
│   ├── performance.md       # metas e gargalos (criar só quando houver metas concretas)
│   ├── workflows.md         # fluxos dev/deploy/ops (loop de desenvolvimento, CI)
│   └── setup.md             # setup do ambiente local (Node LTS, comandos de bootstrap)
│
├── ui/                      # camada de design system e UI (IA-first) — ver seção dedicada
│   ├── design-system.md     # tokens (cor, radius, spacing, sombra), fontes, componentes visuais
│   ├── ui-rules.md          # regras obrigatórias (proibições, padrões de layout, estados)
│   └── component-standards.md # estrutura de componentes, estados, acessibilidade
│
├── agents/
│   ├── architect.md         # decisões arquiteturais, ADRs, stack
│   ├── backend-engineer.md  # APIs e servidor (omitir se SPA puro sem backend)
│   ├── frontend-engineer.md # componentes, estado, consumo de API
│   ├── ui-designer.md       # interfaces, design system, acessibilidade
│   ├── reviewer.md          # revisão de código (checklist de qualidade)
│   ├── researcher.md        # investigação metódica de bugs e fluxos
│   └── optimizer.md         # performance e otimização
│
├── decisions/
│   ├── 0001-exemplo.md      # modelo de ADR (template abaixo)
│   └── ...                  # novas decisões conforme surgirem
│
├── sessions/
│   └── current-task.md      # continuidade entre sessões de IA
│
├── tasks/
│   ├── backlog.md           # tarefas pendentes
│   └── done.md              # tarefas concluídas (mover ao finalizar)
│
└── prompts/                 # prompts reutilizáveis (code-review, debugging, refactor, ...)
    └── code-review.md       # exemplo: prompt de revisão de código
```

Você pode adaptar a estrutura conforme o projeto exigir.

### Notas de adaptação

* **`architecture/backend.md` e `database.md`** — omita em projetos puramente front-end (SPAs, sites estáticos). Isso mantém a base de conhecimento enxuta e sem ruído para os agentes.
* **`agents/backend-engineer.md`** — mesma lógica: só crie se o projeto tiver backend.
* **`engineering/performance.md`** — comece com `workflows.md` e `setup.md`; crie `performance.md` apenas quando houver metas concretas a documentar (ex.: LCP < 2s, bundle < 200KB). Não crie vazio.
* **`ui/` em projetos sem interface gráfica** — opcional. Em projetos API-only, prefira documentar contratos via `architecture/integrations.md` ou `architecture/backend.md`. A camada `ui/` só faz sentido quando há decisão visual a ser cristalizada (Design System, tokens, regras de componente).
* **`tasks/done.md`** — não acumule tarefas concluídas em `backlog.md`; arquive cuidadosamente em `done.md` para manter o backlog focado em trabalho pendente.

### Conteúdo mínimo por arquivo (consolidado)

| Diretório/Arquivo | Quando criar | Conteúdo mínimo |
| --- | --- | --- |
| `project/overview.md` | sempre | Visão geral do projeto em 1-2 parágrafos |
| `project/vision.md` | sempre | Visão aspiracional de longo prazo |
| `project/roadmap.md` | sempre | Marcos e cronograma |
| `project/glossary.md` | sempre | Termos de domínio, siglas, definições |
| `project/business-model.md` | opcional | Modelo de negócio (monetização, usuários-alvo) |
| `architecture/tech-stack.md` | sempre | Linguagens, frameworks, infra, versões |
| `architecture/overview.md` | sempre | Diagramas e visão geral |
| `architecture/backend.md` | se houver backend | Servidor, APIs, padrões |
| `architecture/frontend.md` | se houver UI | UI, estado, componentes, estrutura de arquivos |
| `architecture/database.md` | se houver DB | Modelo de dados, migrações |
| `architecture/infrastructure.md` | sempre | Hospedagem, CI/CD, monitoring |
| `architecture/integrations.md` | se houver serviços externos | APIs externas, webhooks, OAuth |
| `domain/business-rules.md` | sempre | Regras de negócio |
| `domain/entities.md` | sempre | Entidades e relacionamentos (tipos/interfaces) |
| `domain/pricing.md` | se aplicável | Precificação |
| `domain/normalization.md` | se aplicável | Padronização de dados |
| `engineering/conventions.md` | sempre | Modo strict (ex: `TS strict: true`, `verbatimModuleSyntax`), naming (arquivos/variáveis/tipos/exports), padrão de commit (`tipo: descrição`), branch principal |
| `engineering/testing.md` | sempre | Framework (ex: Vitest), localização (`*.test.ts` ao lado do fonte), padrão (`describe/it/expect`), escopo (lógica pura vs DOM), comandos |
| `engineering/security.md` | sempre | Secrets, sanitização (`textContent` vs `innerHTML`), proibições (`eval`, `new Function`), localStorage, CSP |
| `engineering/performance.md` | quando houver metas concretas | Metas (LCP, bundle size), gargalos conhecidos, otimizações |
| `engineering/workflows.md` | sempre | Loop de desenvolvimento, gatilhos de CI/CD, horários de jobs automáticos, comportamento do PR |
| `engineering/setup.md` | sempre | Pré-requisitos (Node LTS, npm), instalação (`npm ci`), comandos de dev/build, comando de verificação completa (typecheck+lint+format+test+build) |
| `ui/design-system.md` | se houver UI | Tokens (cor, radius, spacing, sombra), fontes, componentes visuais, proibições absolutas |
| `ui/ui-rules.md` | se houver UI | Lista de componentes a reutilizar, proibições, regras de layout, responsividade, organização de CSS |
| `ui/component-standards.md` | se houver UI | Estrutura de componentes, estados, acessibilidade, naming |
| `agents/<perfil>.md` | sempre (um por perfil) | Responsabilidade, Limites (o que NÃO fazer), contexto necessário (arquivos a ler), abordagem, anti-padrões |
| `sessions/current-task.md` | sempre | Template em branco com campos: objetivo atual, tarefas em andamento, próximos passos, decisões recentes, blockers, arquivos relevantes |
| `tasks/backlog.md` | sempre | Lista de tarefas pendentes |
| `tasks/done.md` | sempre | Arquivo de tarefas concluídas (mover de backlog ao finalizar) |
| `prompts/<nome>.md` | opcional | Prompts reutilizáveis (code-review, debugging, refactor) |

---

# 3. Configuração de Ferramentas (raiz do repo)

A reestruturação não é só sobre `.ai-context/`. Arquivos raiz devem estar alinhados com as convenções documentadas, senão agentes leem regras que a ferramenta na verdade desconsidera.

### `.editorconfig`

Define o padrão que todos editores deveriam seguir:

```ini
root = true

[*]
charset = utf-8
end_of_line = lf
indent_style = space
indent_size = 2
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false
```

### `.prettierrc`

Deve refletir o que `engineering/conventions.md` documenta. Exemplo:

```json
{
  "semi": false,
  "singleQuote": true,
  "trailingComma": "all",
  "printWidth": 120,
  "tabWidth": 2,
  "arrowParens": "avoid"
}
```

### `.vscode/settings.json`

**Deve ser versionado** (não ignore em `.gitignore`). Mantém formatter, lint on save e SDK do TypeScript consistentes para qualquer humano ou agente que clone o repositório:

```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": { "source.fixAll.eslint": "explicit" },
  "typescript.tsdk": "node_modules/typescript/lib",
  "files.insertFinalNewline": true,
  "files.trimTrailingWhitespace": true,
  "search.exclude": { "**/node_modules": true, "dist": true }
}
```

### `.nvmrc`

Aponte para a **LTS atual**, nunca para versões EOL. Use o codename (`lts/jod`, `lts/iron`, ...) em vez do número — é mais estável entre releases.

```
lts/jod
```

Verifique a LTS ativa em https://nodejs.org/en/about/previous-releases antes de definir. No momento desta escrita, a LTS ativa é `lts/jod` (Node 22).

### `docs/CONTRIBUTING.md`

A branch principal referenciada aqui deve ser **idêntica** à branch referenciada em `engineering/conventions.md` e `engineering/workflows.md`. Inconsistência aqui é a fonte mais comum de bugs de CI em ambientes IA-first.

Template:

```md
# Contribuindo

## Branch principal
`main`

## Commits
Formato: `tipo: descrição`
Tipos: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`

## Regras
- Nunca force push em `main`
- Sempre rode os comandos de verificação antes de commitar (ver `engineering/setup.md`)
- Veja `.ai-context/engineering/conventions.md` para detalhes completos
```

### `AGENTS.md` e `README.md` não devem duplicar conteúdo

* `AGENTS.md` é operacional (ordenação de leitura, regras globais, fluxo de trabalho)
* `README.md` é documentação humana (visão, install, scripts, tree view de `.ai-context/`)
* O README pode ter uma tree ASCII da estrutura `.ai-context/` para rapidamente visualizar onde mora cada conhecimento — atualize quando mover/criar arquivos

---

# Regras Importantes

## Modularidade

Prefira:

* vários arquivos pequenos
  ao invés de:
* poucos arquivos enormes

Cada arquivo deve ter:

* responsabilidade clara
* propósito específico
* leitura rápida
* baixa ambiguidade

---

## Organização Semântica

Separe:

* arquitetura
* regras de negócio
* engenharia
* workflows
* decisões
* prompts
* comportamento dos agentes

Não misture temas diferentes no mesmo arquivo.

---

## Design System e Regras de UI

O diretório `ui/` é uma das adições mais valiosas desta arquitetura. Trata a interface como uma camada de conhecimento própria, separada da arquitetura técnica, permitindo que agentes visuais carreguem APENAS contexto visual.

### Por que separar `ui/` de `architecture/frontend.md`

* `architecture/frontend.md` descreve a **implementação técnica** (framework, estrutura de arquivos, padrão de estado, comunicação entre módulos)
* `ui/` descreve a **decisão visual e as regras de aplicação** (tokens, cores, hierarquia visual, o que NÃO fazer)

Misturar os dois força todo agente a carregar tokens de cor e regras de UX mesmo quando só precisa saber onde mora o código. Separar mantém cada contexto mais barato.

### Conteúdo mínimo de cada arquivo

#### `design-system.md`

* Filosofia visual (ex: "SaaS premium, dark mode, minimalismo funcional")
* Tema (cores, modo default) e tokens de cor organizados por função:
  - backgrounds (`--bg-primary`, `--bg-secondary`, `--bg-card`, `--bg-hover`, `--bg-active`)
  - texto (`--text-primary`, `--text-secondary`, `--text-muted`)
  - cores semânticas (`--color-accent`, `--color-success`, `--color-danger`, `--color-warning`, `--color-info`)
* Espaçamento: escala tokenizada (`--space-1` a `--space-7`); proibir valores arbitrários
* Radius, sombras, tipografia (fonte + hierarquia)
* Componentes visuais com HTML/CSS de referência (cards, botões, inputs, charts, tabs, breadcrumb, sidebar)
* **Proibições absolutas** — ex: "nunca reverter backgrounds para tint azulado", "nunca usar emojis como ícones na sidebar"

#### `ui-rules.md`

* Lista de componentes que DEVEM ser reutilizados antes de criar novos (card, modal, tabela, botão, input, breadcrumb, sidebar, tabs, chart)
* O que NÃO usar (estilos inline, cores hardcoded, padding arbitrário, glassmorphism forte, emojis como ícones)
* Tokens obrigatórios (apontar para o arquivo de tokens, ex: `src/styles/tokens.css`)
* Regras de layout (breadcrumb obrigatório em páginas internas, sidebar com largura fixa via token, scrollbar discreta)
* Responsividade (breakpoints, comportamento esperado em mobile)
* Layout de arquivos CSS (ex: `tokens.css` → `base.css` → `layout.css` → `components.css`)

#### `component-standards.md`

* Filosofia de componentes: pequenos, reutilizáveis, previsíveis, desacoplados, semanticamente claros
* Estrutura de diretórios de componentes (ex: `ui/`, `layout/`, `features/`)
* Separação obrigatória: NÃO misturar DOM/estado/estilos/comunicação no mesmo bloco
* Padronização de cada componente:
  - renderização (DOM)
  - estado externo (sem estado oculto)
  - eventos via `CustomEvent`
  - independência visual de página
* Naming conventions: arquivos `kebab-case.ts`, classes CSS `kebab-case`, preferir classes/data attributes em vez de IDs
* Componentes base obrigatórios (Button, Card, Input, Select, Modal, Table, Tabs, Badge, Tooltip, Dropdown, Sidebar, Header, Page)
* Estados visuais que TODO componente interativo deve suportar (hover, focus, active, disabled, loading, error)
* Estados de dados para listagens (loading skeleton, empty state, error state)
* Acessibilidade (navegação por teclado, foco visível, contraste, `aria-label`, semântica HTML)
* Performance DOM (evitar re-renderizações, listeners duplicados, `innerHTML` gigante)

### O que isso ganha

* Agente `ui-designer` carrega só `ui/` + `architecture/frontend.md`
* Agente `frontend-engineer` carrega só `architecture/frontend.md` + `engineering/conventions.md`
* Agente `backend-engineer` não paga tokens com regras visuais
* Qualquer agente sabe onde procurar ANTES de inventar nova cor/componente: reduz duplicação e drift visual

---

## Decisões Técnicas (ADRs)

Crie arquivos de decisões arquiteturais em:

```text
.ai-context/decisions/
```

Numeração sequencial com prefixo de 4 dígitos: `0001-`, `0002-`, etc.

Formato:

```md
# 0001-nome-da-decisao

## Contexto
Descreva o estado atual e o que motivou a decisão. Seja factual.

## Problema
Qual dor/risco a decisão resolve. Pode ser técnico (escala, manutenção) ou de processo (onboarding lento, consumo de contexto).

## Decisão
O que foi decidido, em uma frase. Depois liste os pontos concretos.

## Consequências
Liste efeitos — positivos e negativos. Seja honesto sobre custos.

## Alternativas consideradas
Liste cada alternativa rejeitada com o motivo de ter sido descartada.
```

### Dica prática

Use o nome da decisão no **singular** (`0001-global-state.md`, não `0001-global-state-e-ui.md`). Uma ADR, uma decisão. Se uma discussão gerar duas decisões independentes, divida em duas ADRs.

### Exemplo concreto (extraído de projeto real)

```md
# 0005 — Reestruturação IA-first do contexto

## Contexto
O projeto tinha um `AGENTS.md` inchado (122 linhas) e nenhuma estrutura modular de contexto, dificultando onboarding, consumo de contexto e manutenção.

## Problema
- AGENTS.md misturava orquestração, documentação e regras de negócio
- Sem separação entre arquitetura, domínio, engenharia e decisões
- Sem perfis de agentes especializados
- Duplicação entre AGENTS.md e README.md

## Decisão
Adotar arquitetura de contexto modular IA-first:
- `AGENTS.md` como entry point (~50 linhas)
- `.ai-context/` como base de conhecimento estruturada
- Subdiretórios: project/, architecture/, domain/, engineering/, agents/, ui/, decisions/, sessions/, tasks/, prompts/
- Perfis de agentes com responsabilidades e limites claros
- ADRs em arquivos individuais

## Consequências
+ Onboarding mais rápido para novos agentes
+ Menor consumo de tokens por sessão
+ Conhecimento reutilizável entre agentes
+ Facilidade para adicionar novo contexto sem poluir entry point
- Exige disciplina para manter arquivos pequenos e atualizados

## Alternativas consideradas
- Manter AGENTS.md monolítico: não escala
- Wiki externa: fora do repositório, difícil para agentes acessarem
```

---

# Agentes Especializados

Crie perfis especializados para agentes.

Cada agente deve possuir:

* responsabilidade
* limites (o que NÃO deve fazer)
* contexto necessário (quais arquivos de `.ai-context/` ler)
* como deve pensar (heurísticas e abordagens)
* o que evitar (anti-padrões comuns)
* prompt padrão (gatilho inicial opcional)

Cada perfil deve começar com a **Responsabilidade** em uma frase e conter uma seção **Limites** listando explicitamente o que aquele agente NÃO deve fazer. Isso evita que agentes invadam responsabilidades uns dos outros em projetos com múltiplas sessões simultâneas.

### Perfis recomendados

* `architect.md` — decisões arquiteturais e ADRs
  - Abordagem: prefira simplicidade e zero dependências; documente como ADRs; considere o custo de contexto para LLMs.
  - Anti-padrões: adicionar frameworks sem necessidade; mudar arquitetura sem ADR; ignorar o impacto em agentes futuros.
* `backend-engineer.md` — APIs, servidor, banco de dados, auth (omitir em projetos sem backend)
* `frontend-engineer.md` — componentes, estado, consumo de API
* `ui-designer.md` — interfaces gráficas, design system, protótipos, acessibilidade
  - Filosofia visual: clareza > consistência > hierarquia > UX previsível, não efeitos chamativos.
  - Contexto obrigatório: `ui/design-system.md`, `ui/ui-rules.md`, `ui/component-standards.md`, `architecture/frontend.md`.
  - Proibições típicas: estilos inline, cores hardcoded, glassmorphism pesado, animações chamativas, padding arbitrário.
* `reviewer.md` — revisão de código
  - Checklist: `any` implícitos; variáveis não usadas; duplicação de lógica; exports sem verificar importadores; caminhos quebrados no `AGENTS.md`.
  - Verificar: type safety (strict mode); existência de testes para lógica nova; código morto; padrão de commit.
* `researcher.md` — investigação metódica de bugs e fluxos
  - Passo a passo: reproduza o problema → entenda o fluxo esperado vs real → isole a causa (grep, logs, debug) → proponha correção → documente a descoberta.
  - Anti-padrões: chutar soluções sem entender; modificar arquivos não relacionados; ignorar testes existentes.
* `optimizer.md` — performance e gargalos

---

# Contexto Operacional

Crie:

```text
.ai-context/sessions/current-task.md
```

Esse arquivo deve ser um **template em branco com campos a preencher por sessão**:

* objetivo atual
* tarefas em andamento
* próximos passos
* decisões recentes
* blockers
* arquivos relevantes

O objetivo é melhorar continuidade entre sessões de IA.

---

# Fluxo Esperado para Agentes

Os agentes devem seguir esta ordem:

1. Ler `AGENTS.md` — entry point obrigatório
2. Ler contexto essencial na ordem indicada em AGENTS.md
3. Consultar `sessions/current-task.md` para continuidade entre sessões
4. Entender arquitetura (`architecture/`)
5. Entender regras de negócio (`domain/`)
6. Verificar decisões anteriores (`decisions/`)
7. Ler o perfil correspondente em `agents/` (se aplicável)
8. Verificar o backlog em `tasks/backlog.md`
9. Executar alterações
10. Atualizar `tasks/` (mover concluídos para `done.md`) e `sessions/current-task.md`
11. Documentar decisões relevantes em `decisions/`

---

# Critérios de Qualidade

A nova estrutura deve:

* facilitar onboarding de agentes
* reduzir consumo de contexto
* melhorar consistência de código
* reduzir alucinações
* melhorar reutilização de conhecimento
* permitir múltiplos agentes trabalhando juntos
* escalar bem com crescimento do projeto

---

# Sua Tarefa

Analise o projeto atual e:

1. reorganize toda estrutura IA-first
2. mova conteúdos para locais apropriados
3. quebre arquivos grandes em módulos menores
4. elimine duplicações
5. normalize nomenclaturas
6. melhore clareza semântica
7. crie arquivos ausentes importantes (`agents/`, `domain/`, `sessions/current-task.md`, `project/vision.md`, `project/roadmap.md`, etc.)
8. melhore o `AGENTS.md` (orquestração concisa)
9. reorganize `.ai-context/` em diretórios modulares
10. crie perfis de agentes especializados em `agents/` (incluindo `ui-designer.md`)
11. crie a pasta `domain/` com regras de negócio, entidades, normalização
12. atualize scripts de bootstrap se houverem (ex: `copy_stack_extra` paths)
13. atualize prompts em `prompts/` para referenciar os novos caminhos
14. crie `sessions/current-task.md` para continuidade entre sessões
15. corrija configurações de ferramentas (`.vscode/settings.json`, `.editorconfig`, `.prettierrc`)
16. crie `src/.gitkeep` como placeholder de código-fonte, se não existir
17. normalize branches em `docs/CONTRIBUTING.md` e `engineering/conventions.md`
18. atualize `.nvmrc` para a LTS mais recente (ver https://nodejs.org/en/about/previous-releases)
19. adicione `README.md` com tree view da estrutura `.ai-context/`
20. execute bootstrap scripts para garantir que funcionam após as mudanças
21. documente as decisões estruturais tomadas

Ao finalizar:

* apresente a nova estrutura de diretórios
* explique as mudanças realizadas
* destaque problemas encontrados
* explique melhorias para uso com agentes de IA

---

## Checklist de Validação

Antes de concluir, verifique:

### Estrutura `.ai-context/`

- [ ] `AGENTS.md` tem no máximo ~60 linhas e funciona como entry point
- [ ] Nenhum caminho referenciado em `AGENTS.md` está quebrado (todos os arquivos existem)
- [ ] `project/`, `architecture/`, `domain/`, `engineering/`, `agents/` existem e têm conteúdo
- [ ] `ui/` existe com `design-system.md`, `ui-rules.md` e `component-standards.md` (apenas em projetos com interface gráfica)
- [ ] `sessions/current-task.md` existe como template em branco preenchível por sessão
- [ ] `prompts/` tem ao menos um prompt (se aplicável)
- [ ] Arquivos antigos foram removidos (não sobraram versões achatadas)
- [ ] Nomenclatura é consistente (ex: não misturar `conventions.md` e `coding-standards.md`)
- [ ] Perfis em `agents/` têm seção "Responsabilidade" e "Limites" explícitas
- [ ] ADRs são numerados sequencialmente (`0001-`, `0002-`, ...)
- [ ] Não há duplicação de conteúdo (em especial entre `AGENTS.md` e `README.md`, e entre `ui/` e `architecture/frontend.md`)

### Configuração (raiz do repo)

- [ ] `.editorconfig` e `.prettierrc` (se existir) estão alinhados com `engineering/conventions.md`
- [ ] `.nvmrc` aponta para LTS atual (não uma versão EOL)
- [ ] `.vscode/settings.json` não usa configurações depreciadas e **está versionado**
- [ ] `docs/CONTRIBUTING.md` referencia branch consistente com `engineering/conventions.md` e `workflows.md`
- [ ] `README.md` tem visibilidade clara da estrutura `.ai-context/` (tree ASCII atualizada)
- [ ] `src/` (ou pasta de código-fonte equivalente) existe como placeholder
- [ ] `.gitignore` não esconde arquivos de configuração que devem ser versionados (ex: `.vscode/settings.json`)

### Adaptação ao tipo de projeto

- [ ] **Se projeto é SPA sem backend:** `architecture/backend.md`, `database.md` e `agents/backend-engineer.md` foram omitidos (não criados vazios)
- [ ] **Se projeto tem backend:** os três arquivos acima existem e têm conteúdo
- [ ] **Se projeto não tem UI gráfica:** `ui/` foi omitido (contratos via `architecture/integrations.md` ou `backend.md`)
- [ ] **Se projeto tem UI:** `ui/` contém `design-system.md`, `ui-rules.md`, `component-standards.md` com conteúdo

### Bootstrap e validação final

- [ ] Scripts de bootstrap (se houver) foram atualizados com os novos paths
- [ ] Prompts em `prompts/` referenciam caminhos corretos
- [ ] Scripts de bootstrap funcionam sem erro (teste executando-os)
- [ ] Comando de verificação do projeto passa (ex: `npm run typecheck && npm run lint && npm run test && npm run build` — ajuste ao stack)
- [ ] **Próprio `restructure-project.md` foi removido** ou movido para `decisions/` como ADR após concluir a reestruturação (este arquivo é prompt de tarefa, não conhecimento persistente)
