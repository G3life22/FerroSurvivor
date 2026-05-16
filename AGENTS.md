# FerroSurvivor - AGENTS Instructions

## Projeto
FerroSurvivor é um jogo indie em Godot 4 inspirado em Vampire Survivors com tema ferroviário/logístico.

## Objetivo
Criar um protótipo pequeno, modular, divertido e iterativo.

## Stack
- Godot 4
- GDScript
- GitHub
- Codex
- OpenAI Codex Cloud
- Open WebUI
- Ollama

## Regras Obrigatórias

### Arquitetura
- NÃO recriar sistemas já existentes.
- NÃO criar versões duplicadas de cenas/scripts.
- Reutilizar sistemas existentes sempre que possível.
- Manter scripts pequenos e separados por responsabilidade.
- Uma feature por vez.

### Godot
- O projeto usa GODOT 4.
- Sempre usar instantiate() e nunca instance().
- Respeitar paths reais do projeto.
- Não inventar caminhos inexistentes.

### Segurança de Alteração
- Fazer a MENOR alteração funcional possível.
- Não alterar sistemas de HP, ataque, HUD ou moedas sem necessidade.
- Não quebrar funcionalidades existentes.

### Processo
Antes de implementar:
1. Ler README.md
2. Ler ROADMAP.md
3. Ler docs/ai-context/project_context.md

Antes de alterar arquivos:
- Explicar quais arquivos serão modificados/criados.
- Explicar objetivo da alteração.

Após implementar:
- Atualizar README.md
- Atualizar ROADMAP.md
- Manter compatibilidade com Godot 4.

## Estrutura Atual
- scenes/player/player.tscn
- scenes/enemies/enemy.tscn
- scenes/items/coin.tscn
- scenes/world/world.tscn
- scenes/ui/hud.tscn

## Próxima Feature Prioritária
Spawn automático de inimigos reutilizando enemy.tscn existente.

## Ordem de Prioridade
1. Ler BUGS.md primeiro.
2. Se houver bug aberto, resolver o bug antes de qualquer feature.
3. Se não houver bug aberto, pegar a primeira tarefa P1 do BACKLOG.md.
4. Implementar apenas uma tarefa por vez.
5. Após implementar, atualizar BUGS.md, BACKLOG.md, ROADMAP.md e README.md quando aplicável.
6. Nunca iniciar próxima tarefa sem validação do usuário.
