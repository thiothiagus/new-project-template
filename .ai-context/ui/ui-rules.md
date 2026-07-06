# Regras de UI

<!-- Regras OBRIGATÓRIAS para implementação de interface. Diferente de `design-system.md`
(decisão visual), este arquivo define o que fazer e o que NÃO fazer ao construir telas. -->

## Componentes que DEVEM ser reutilizados
Antes de criar um novo componente, verifique se já existe:
<!-- - Card
- Modal
- Table
- Button
- Input
- Breadcrumb
- Sidebar
- Tabs
- Chart -->

## Proibições
<!--
- Estilos inline (`style="..."`)
- Cores hardcoded (use sempre tokens)
- Padding/margin arbitrários (use a escala `--space-*`)
- Glassmorphism forte
- Emojis como ícones (use a biblioteca de ícones do projeto)
- Animações chamativas que prejudiquem clareza
-->

## Tokens obrigatórios
Todo CSS deve referenciar tokens do arquivo de tokens do projeto (ex: `src/styles/tokens.css`).
Nenhum valor visual deve ser hardcoded.

## Regras de layout
<!--
- Breadcrumb obrigatório em páginas internas
- Sidebar com largura fixa via token (`--sidebar-width`)
- Scrollbar discreta (não destaca visualmente)
-->

## Responsividade
<!--
- Breakpoints: mobile < 768px, tablet 768-1024px, desktop > 1024px
- Comportamento esperado em mobile: sidebar vira drawer, table vira card-list
-->

## Organização de CSS
<!--
Ordem de carga sugerida:
1. `tokens.css` (variáveis)
2. `base.css` (reset, tipografia base)
3. `layout.css` (grid, sidebar, header)
4. `components.css` (componentes visuais)
-->
