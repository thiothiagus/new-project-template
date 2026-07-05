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

# Objetivos da Reorganização

Você deve:

## 1. Reestruturar o `AGENTS.md`

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

## 2. Reorganizar `.ai-context/`

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
│   ├── backend.md           # servidor, APIs, padrões
│   ├── frontend.md          # UI, estado, componentes
│   ├── database.md          # modelo de dados, migrações
│   ├── infrastructure.md    # hospedagem, CI/CD, monitoring
│   └── integrations.md      # serviços externos
│
├── domain/
│   ├── business-rules.md    # regras de negócio
│   ├── entities.md          # entidades e relacionamentos
│   ├── pricing.md           # precificação (se aplicável)
│   └── normalization.md     # padronização de dados
│
├── engineering/
│   ├── conventions.md       # padrões de código e estilo
│   ├── testing.md           # estratégia de testes
│   ├── security.md          # práticas de segurança
│   ├── performance.md       # metas e gargalos
│   ├── workflows.md         # fluxos dev/deploy/ops
│   └── setup.md             # setup do ambiente local
│
├── agents/
│   ├── architect.md         # decisões arquiteturais
│   ├── backend-engineer.md  # APIs e servidor
│   ├── frontend-engineer.md # componentes e estado
│   ├── ui-designer.md       # interfaces gráficas e design system
│   ├── reviewer.md          # revisão de código
│   ├── researcher.md        # investigação e exploração
│   └── optimizer.md         # performance e otimização
│
├── decisions/
│   ├── 0001-exemplo.md      # modelo de ADR
│   └── ...                  # novas decisões conforme surgirem
│
├── sessions/
│   └── current-task.md      # continuidade entre sessões de IA
│
├── tasks/
│   ├── backlog.md           # tarefas pendentes
│   └── done.md              # tarefas concluídas
│
└── prompts/                 # prompts reutilizáveis (code-review, debugging, refactor, ...)
```

Você pode adaptar a estrutura conforme o projeto exigir.

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

## Decisões Técnicas

Crie arquivos de decisões arquiteturais em:

```text
.ai-context/decisions/
```

Formato:

```md
# 001-nome-da-decisao

## Contexto
## Problema
## Decisão
## Consequências
## Alternativas consideradas
```

---

## Agentes Especializados

Crie perfis especializados para agentes.

Cada agente deve possuir:

* responsabilidade
* limites (o que NÃO deve fazer)
* contexto necessário (quais arquivos de `.ai-context/` ler)
* como deve pensar (heurísticas e abordagens)
* o que evitar (anti-padrões comuns)
* prompt padrão (gatilho inicial opcional)

### Perfis recomendados

* `architect.md` — decisões arquiteturais e ADRs
* `backend-engineer.md` — APIs, servidor, banco de dados, auth
* `frontend-engineer.md` — componentes, estado, consumo de API
* `ui-designer.md` — interfaces gráficas, design system, protótipos, acessibilidade
* `reviewer.md` — revisão de código
* `researcher.md` — investigação metódica de bugs e fluxos
* `optimizer.md` — performance e gargalos

---

## Contexto Operacional

Crie:

```text
.ai-context/sessions/current-task.md
```

Esse arquivo deve armazenar:

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
18. atualize `.nvmrc` para a LTS mais recente (ex: `lts/iron`)
19. adicione `README.md` com tree view da estrutura `.ai-context/`
20. execute bootstrap scripts para garantir que funcionam após as mudanças
21. documente as decisões estruturais tomadas

Ao finalizar:

* apresente a nova estrutura de diretórios
* explique as mudanças realizadas
* destaque problemas encontrados
* explique melhorias para uso com agentes de IA

## Checklist de validação

Antes de concluir, verifique:

- [ ] `AGENTS.md` tem no máximo ~60 linhas e funciona como entry point
- [ ] Nenhum caminho referenciado em `AGENTS.md` está quebrado (todos os arquivos existem)
- [ ] `project/`, `architecture/`, `domain/`, `engineering/`, `agents/` existem e têm conteúdo
- [ ] `sessions/current-task.md` existe e tem template preenchível
- [ ] Arquivos antigos foram removidos (não sobraram versões achatadas)
- [ ] Scripts de bootstrap (se houver) foram atualizados com os novos paths
- [ ] Prompts em `prompts/` referenciam caminhos corretos
- [ ] Nomenclatura é consistente (ex: não misturar `conventions.md` e `coding-standards.md`)
- [ ] Não há duplicação de conteúdo entre arquivos
- [ ] `.editorconfig` e `.prettierrc` (se existir) estão alinhados
- [ ] `.nvmrc` aponta para LTS atual (não uma versão EOL)
- [ ] `.vscode/settings.json` não usa configurações depreciadas
- [ ] `docs/CONTRIBUTING.md` referencia branch consistente com `engineering/conventions.md`
- [ ] `README.md` tem visibilidade clara da estrutura `.ai-context/`
- [ ] `src/` (ou pasta de código-fonte equivalente) existe como placeholder
- [ ] `.gitignore` não esconde arquivos de configuração que devem ser versionados (ex: `.vscode/settings.json`)
- [ ] Scripts de bootstrap funcionam sem erro (teste executando-os)
