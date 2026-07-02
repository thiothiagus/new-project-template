# Operações

## Monitoramento

### Métricas coletadas
- Taxa de requisições por segundo
- Tempo de resposta por endpoint
- Latência e tempo de atividade de componentes

### Logs coletados
- Aplicação: nível INFO/DEBUG/WARN/ERROR
- Sistema: métricas de recursos, eventos de sistema
- Segurança: logs de auditoria de acessos

### Monitoramento de alertas
Configure alertas para:
- Erros percentuais
- Limites de recursos
- Requerimento de manutenção / atualizações

## Execução de manutenção

### Agendamento de tarefas
- Limpeza de logs (rascunho)
- Atualização de bancos de dados (migrations)
- Coleta de métricas a cada hora
- Verificação de integridade a cada 30 minutos

### Trabalho manual
- [ ] Gerenciar acumulação de logs
- [ ] Validar se o backup mais recente está correto e íntegro
- [ ] Inspecionar discrepâncias de recursos
- [ ] Atualizar variáveis de ambiente em inspeção de segurança periódica