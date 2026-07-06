# Contribuindo

## Branch principal
`main`

## Regras
- Nunca faça force push em `main`
- Sempre rode os comandos de verificação antes de commitar (ver `.ai-context/engineering/setup.md`)
- Veja `.ai-context/engineering/conventions.md` para detalhes completos

## Branch naming
- `feature/*` — Novas funcionalidades
- `fix/*` — Correções de bugs
- `docs/*` — Documentação
- `chore/*` — Tarefas de manutenção
- `refactor/*` — Refatoração

## Commits
Formato: `tipo: descrição`
Tipos: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`
- Escreva mensagens descritivas e concisas
- Sem mensagens de commit "WIP"

## Workflow
1. Crie um branch a partir de `main` com o prefixo apropriado
2. Faça commits com mensagens descritivas
3. Execute os testes locaismente antes do push
4. Abra um PR para `main` com descrição do que mudou
5. Todas as revisões devem ser aprovadas antes do merge

## Checklist de Contribuição
- [ ] Codifique seguindo as convenções do projeto
- [ ] Adicione testes cobrindo a nova funcionalidade
- [ ] Execute os testes locaismente
- [ ] Documente novas APIs ou mudanças
- [ ] Execute linting/formatação
- [ ] Verifique a qualidade do código antes do PR