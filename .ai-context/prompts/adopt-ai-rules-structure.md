# Adotar estrutura de AI_RULES.md

Aplica a estrutura de regras de IA (aprendizado contínuo) em projetos que ainda usam o template antigo (sem `AI_RULES.md` e sem `.ai-context/rules/`).

## Instrução para o agente

Execute os passos abaixo **exatamente nesta ordem**:

---

### Passo 1 — Criar `AI_RULES.md` (raiz)

Crie `AI_RULES.md` na raiz do projeto com este conteúdo:

```markdown
# AI_RULES.md

Índice central da base de conhecimento de aprendizado contínuo para agentes de IA.

## Como usar

1. **Leia este índice** para identificar qual(is) arquivo(s) de regras consultar.
2. **Leia o(s) arquivo(s) específico(s)** conforme o guia abaixo.
3. **Ao resolver um problema**, registre a lição no arquivo do domínio correspondente.

## Guia de consulta por tipo de tarefa

| Tipo de tarefa | Arquivo(s) a ler |
|---|---|
| Qualquer tarefa (sempre ler) | `.ai-context/rules/general.md` |
| Backend (API, banco, lógica) | `.ai-context/rules/backend.md` |
| Frontend (UI, componentes, estilos) | `.ai-context/rules/frontend.md` |
| Infraestrutura (deploy, CI/CD, cloud) | `.ai-context/rules/infrastructure.md` |
| Testes | `.ai-context/rules/testing.md` |

Se a tarefa abranger **múltiplos domínios**, leia os arquivos de todos os domínios envolvidos.

## Template para novas entradas

Ao registrar um novo aprendizado em qualquer arquivo de regras, use o formato abaixo:

**Regra permanente:**
```markdown
| N | `descrição clara da regra` | contexto onde se aplica |
```

**Lições aprendidas:**
```markdown
| N | YYYY-MM-DD | descrição do problema | causa raiz | solução aplicada | como prevenir |
```
```

---

### Passo 2 — Criar `.ai-context/rules/` e arquivos de domínio

Crie o diretório `.ai-context/rules/` (se não existir) e, dentro dele, os cinco arquivos a seguir.

Cada arquivo deve seguir este **template idêntico**:

```markdown
# AI Rules — <NOME_DO_DOMÍNIO>

Regras e lições específicas de <NOME_DO_DOMÍNIO>.

## Regras Permanentes

| # | Regra | Contexto |
|---|-------|----------|
| — | *Nenhuma regra cadastrada ainda.* | — |

## Lições Aprendidas

| # | Data | Problema | Causa Raiz | Solução | Prevenção |
|---|------|----------|------------|---------|-----------|
| — | — | *Nenhum registro ainda.* | — | — | — |
```

Crie um arquivo para **cada domínio** abaixo, substituindo `<NOME_DO_DOMÍNIO>` conforme a tabela:

| Arquivo | `<NOME_DO_DOMÍNIO>` | Contexto |
|---|---|---|
| `.ai-context/rules/general.md` | Gerais | aplicáveis a qualquer domínio |
| `.ai-context/rules/backend.md` | Backend | API, banco de dados, lógica de negócio |
| `.ai-context/rules/frontend.md` | Frontend | UI, componentes, estilos, acessibilidade |
| `.ai-context/rules/infrastructure.md` | Infraestrutura | deploy, CI/CD, cloud, Docker |
| `.ai-context/rules/testing.md` | Testes | estratégia, boas práticas, ferramentas |

---

### Passo 3 — Atualizar `AGENTS.md`

Localize o arquivo `AGENTS.md` na raiz do projeto e faça as seguintes alterações:

#### 3a. Adicionar itens na "Ordem de leitura do contexto"

Encontre o item que referencia `agents/` (último bloco de itens antes de "Regras globais") e **adicione dois itens antes dele**:

```markdown
26. **`AI_RULES.md` — Base de conhecimento de aprendizado contínuo (leia e siga obrigatoriamente)**
27. **`.ai-context/rules/` — Arquivos de regras por domínio (consulte o índice em `AI_RULES.md` para saber qual ler)**
```

Ajuste a numeração dos itens seguintes (+2).

#### 3b. Adicionar regras globais

Na seção "Regras globais", adicione duas novas regras:

```markdown
- **Leia `AI_RULES.md` antes de iniciar qualquer tarefa e siga todas as regras registradas.**
- **Ao resolver um problema, atualize o arquivo de regras do domínio correspondente em `.ai-context/rules/` com a lição aprendida (problema, causa raiz, solução, prevenção).**
```

---

### Verificação final

Após executar os 3 passos, confirme que a estrutura está correta:

- [ ] `AI_RULES.md` existe na raiz e contém o índice com guia de consulta
- [ ] `.ai-context/rules/general.md` existe
- [ ] `.ai-context/rules/backend.md` existe
- [ ] `.ai-context/rules/frontend.md` existe
- [ ] `.ai-context/rules/infrastructure.md` existe
- [ ] `.ai-context/rules/testing.md` existe
- [ ] Cada arquivo de regras tem as seções "Regras Permanentes" e "Lições Aprendidas"
- [ ] `AGENTS.md` lista `AI_RULES.md` (item #26 na ordem de leitura)
- [ ] `AGENTS.md` lista `.ai-context/rules/` (item #27 na ordem de leitura)
- [ ] `AGENTS.md` contém as duas novas regras globais
