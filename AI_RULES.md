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
