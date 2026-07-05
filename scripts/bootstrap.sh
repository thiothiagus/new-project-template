#!/usr/bin/env bash
set -euo pipefail

echo "== Bootstrap do novo projeto =="
read -rp "Nome do projeto: " PROJECT_NAME
read -rp "Descrição curta do projeto: " PROJECT_DESCRIPTION
CURRENT_DATE=$(date +%Y-%m-%d)
echo ""
echo "Tipo de projeto:"
echo "1) Web/Frontend"
echo "2) Backend/API"
echo "3) Full-stack (Web/Frontend + Backend/API)"
echo "4) Dados/ML"
echo "5) CLI"
echo "6) Genérico (sem extra de stack)"
read -rp "Escolha [1-6]: " STACK_CHOICE

copy_stack_extra() {
  local stack_dir="$1"
  local target_name="$2"
  if [ -f "stacks/${stack_dir}/context-extra.md" ]; then
    cp "stacks/${stack_dir}/context-extra.md" ".ai-context/architecture/${target_name}"
    echo "Copiado contexto extra de: ${stack_dir}"
  fi
}

case "$STACK_CHOICE" in
  1) copy_stack_extra "web-frontend" "stack-extra-frontend.md" ;;
  2) copy_stack_extra "backend-api" "stack-extra-backend.md" ;;
  3)
    copy_stack_extra "web-frontend" "stack-extra-frontend.md"
    copy_stack_extra "backend-api" "stack-extra-backend.md"
    ;;
  4) copy_stack_extra "data-ml" "stack-extra-data-ml.md" ;;
  5) copy_stack_extra "cli" "stack-extra-cli.md" ;;
  6) echo "Sem contexto extra de stack." ;;
  *) echo "Opção inválida, seguindo sem contexto extra." ;;
esac

echo ""
echo "Substituindo placeholders..."
find . -type f -name "*.md" -not -path "./stacks/*" -not -path "./.ai-context/prompts/restructure-project.md" | while read -r file; do
  sed -i.bak \
    -e "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g" \
    -e "s/{{PROJECT_DESCRIPTION}}/${PROJECT_DESCRIPTION}/g" \
    -e "s/{{DATE}}/${CURRENT_DATE}/g" \
    "$file"
  rm -f "${file}.bak"
done

echo ""
read -rp "Remover a pasta stacks/ (não é mais necessária)? [y/N]: " REMOVE_STACKS
if [[ "$REMOVE_STACKS" =~ ^[Yy]$ ]]; then
  rm -rf stacks
  echo "Pasta stacks/ removida."
fi

echo ""
read -rp "Inicializar um novo repositório git aqui? [y/N]: " INIT_GIT
if [[ "$INIT_GIT" =~ ^[Yy]$ ]]; then
  rm -rf .git
  git init
  git add .
  git commit -m "chore: bootstrap do projeto ${PROJECT_NAME}"
  echo "Repositório git inicializado com o primeiro commit."
fi

echo ""
echo "== Bootstrap concluído =="
echo "Projeto: ${PROJECT_NAME}"
echo "Descrição: ${PROJECT_DESCRIPTION}"
