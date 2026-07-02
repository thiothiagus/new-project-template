# Documentação

Documentação de projetos de software que não está vinculada ao contexto de Inteligência Artificial.

## Uso
Os agentes de IA consultam `.ai-context/` para tarefas relacionadas ao contexto. Esta pasta contém documentação técnica:

- Arquitetura e fluxos de alto nível (caso não cobertos pela IA)
- Guerras de design e histórico de decisões (caso não listado em `.ai-context/decisions/`)
- Estratégias de implantação, observação e manutenção não relacionadas à IA

### Padrão tipico de documento

```markdown
# Nome do documento

## Propósito

## Design

## Configuração

## Procedimentos

## Verificação
```

## Sobre este projeto

Este documento contém informações gerais para os usuários do projeto, como contributing guidelines, etapas de implantação e procedimentos operacionais.

## Conteúdo relacionado

- `.ai-context/00-overview.md` — Visão geral alinhada à IA
- `.ai-context/decisions/` — Decisões arquiteturais já tomadas
- Scripts nos diretórios `scripts/` para implantação, CI/CD e operações de rotina