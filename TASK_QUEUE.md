# FerroSurvivor - TASK QUEUE

## REGRAS GERAIS

- Bugs P0 e P1 têm prioridade máxima.
- O Codex deve resolver bugs antes de features.
- O Codex pode implementar múltiplas features em sequência, mas deve atualizar o status de cada uma.
- Após concluir uma tarefa:
  - mover para READY_FOR_TEST
  - atualizar README.md
  - atualizar ROADMAP.md quando necessário
- Nunca recriar sistemas já existentes.
- Sempre usar Godot 4.
- Sempre ler AGENTS.md, README.md, ROADMAP.md e docs/ai-context/project_context.md antes de implementar.

---

# BUGS_OPEN

Nenhum bug aberto.

---

# TODO_PRIORITY_P1

## [FEATURE] XP Crítico - Loot de Experiência
STATUS: PENDING

Objetivo:
Quando um inimigo morre, ele deixa atrás de si um item de experiência que pode ser coletado pelo jogador.

Componentes sugeridos:
- scenes/items/experience.tscn
- scripts/items/experience.gd
- modificação em enemy.gd para gerar XP ao morrer
- integração com HUD/world/player conforme arquitetura existente

Requisitos:
- XP aparece na posição onde o inimigo morreu
- Player coleta XP ao encostar
- Item de XP desaparece ao coletar
- Não implementar level up ainda
- Atualizar README.md e ROADMAP.md

Benefícios:
- Sistema de recompensa visível
- Incentivo a farmar inimigos
- Base para progressão de level

---

## [FEATURE] Progressão de Level - Sistema de Stats
STATUS: PENDING

Objetivo:
O jogador acumula XP, sobe de nível e ganha aumento de dano e vida máxima.

Componentes sugeridos:
- sistema de stats do player
- funções para adicionar XP e verificar level up
- HUD mostrando XP, level e stats principais

Requisitos:
- XP acumulado aumenta level
- Level aumenta dano causado
- Level aumenta vida máxima
- HUD mostra level atual
- Atualizar README.md e ROADMAP.md

Benefícios:
- Progressão clara
- Incentivo a continuar jogando
- Base para balanceamento

---

## [FEATURE] Inimigos Escaláveis - Níveis de Inimigos
STATUS: PENDING

Objetivo:
Inimigos possuem níveis que aumentam HP e XP dropado.

Componentes sugeridos:
- enemy.gd com variáveis level, max_hp e xp_value
- spawn system capaz de gerar inimigos de níveis diferentes
- indicação visual simples do nível, se possível

Requisitos:
- Inimigos de nível maior têm mais HP
- Inimigos de nível maior dropam mais XP
- XP base pode ser multiplicado pelo nível
- Manter compatibilidade com spawn system
- Atualizar README.md e ROADMAP.md

Benefícios:
- Dificuldade crescente
- Mais variedade
- Melhor equilíbrio conforme jogador evolui

---

# TODO_PRIORITY_P2

## [FEATURE] Timer de sobrevivência
STATUS: PENDING

Objetivo:
Mostrar tempo vivo na HUD.

---

## [FEATURE] Balanceamento inicial
STATUS: PENDING

Objetivo:
Balancear HP, dano, velocidade, spawn rate, XP e progressão.

---

# READY_FOR_TEST

Nenhuma tarefa aguardando teste.

---

# DONE

Nenhuma tarefa concluída.
