# Padrões de Componentes

<!--
Define COMO construir componentes. Diferente de `design-system.md` (aparência) e
`ui-rules.md` (regras de uso), este arquivo define estrutura, estados e acessibilidade.
-->

## Filosofia de componentes
Componentes devem ser: pequenos, reutilizáveis, previsíveis, desacoplados e semanticamente claros.

## Estrutura de diretórios
<!--
Ex:
src/
├── ui/         # componentes base (Button, Card, Input, Modal, ...)
├── layout/     # componentes de layout (Header, Sidebar, Page, Breadcrumb)
└── features/   # componentes específicos de funcionalidade
-->

## Separação obrigatória
NUNCA misture no mesmo bloco:
- renderização (DOM)
- estado externo
- estilos
- comunicação (fetch / eventos)

Cada responsabilidade deve estar isolada e testável.

## Padrão de cada componente
- **Renderização**: pura, baseada em props/estado externo
- **Estado externo**: NÃO ter estado oculto; o estado que importa para o pai deve ser emitido
- **Eventos**: via `CustomEvent` (ou callback prop), nunca chamadas diretas a globais
- **Independência visual**: o componente não depende da página em que está inserido

## Naming conventions
- Arquivos: `kebab-case.ts` (ou `.tsx` / `.vue` / etc.)
- Classes CSS: `kebab-case`
- Prefira classes ou `data-*` em vez de IDs para estilização/comportamento

## Componentes base obrigatórios
<!--
- Button
- Card
- Input
- Select
- Modal
- Table
- Tabs
- Badge
- Tooltip
- Dropdown
- Sidebar
- Header
- Page
-->

## Estados visuais
TODO componente interativo deve suportar:
- hover
- focus
- active
- disabled
- loading
- error

## Estados de dados para listagens
- loading skeleton
- empty state
- error state

## Acessibilidade
- Navegação completa por teclado
- Foco visível (nunca `outline: none` sem替代)
- Contraste AA mínimo
- `aria-label` quando o texto visível não basta
- Semântica HTML correta (`button` para ações, `nav` para navegação, etc.)

## Performance DOM
- Evitar re-renderizações desnecessárias
- Evitar listeners duplicados
- Evitar `innerHTML` gigante; prefira templates/componentes
