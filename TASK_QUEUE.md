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

Nenhuma tarefa P1 pendente.

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

## [FEATURE] XP Crítico - Loot de Experiência
STATUS: READY_FOR_TEST

Objetivo:
Quando um inimigo morre, ele deixa atrás de si um item de experiência que pode ser coletado pelo jogador.

Implementado:
- XP aparece na posição onde o inimigo morreu.
- Player coleta XP ao encostar.
- Item de XP desaparece ao coletar.
- Level up ainda não abre escolhas de upgrade.
- README.md e ROADMAP.md atualizados.

---

## [FEATURE] Progressão de Level - Sistema de Stats
STATUS: READY_FOR_TEST

Objetivo:
O jogador acumula XP, sobe de nível e ganha aumento de dano e vida máxima.

Implementado:
- XP acumulado aumenta level.
- Level aumenta dano causado.
- Level aumenta vida máxima.
- HUD mostra level atual, XP e stats principais.
- README.md e ROADMAP.md atualizados.

---

## [FEATURE] Inimigos Escaláveis - Níveis de Inimigos
STATUS: READY_FOR_TEST

Objetivo:
Inimigos possuem níveis que aumentam HP e XP dropado.

Implementado:
- Inimigos de nível maior têm mais HP.
- Inimigos de nível maior dropam mais XP.
- XP base é multiplicado pelo nível.
- `configure_level()` mantém compatibilidade com futuros sistemas de spawn.
- Indicação visual simples do nível aparece para inimigos acima do nível 1.
- README.md e ROADMAP.md atualizados.

---

# DONE

Nenhuma tarefa concluída.

## [P0][BUG] Moedas somem em grupo ao coletar uma
STATUS: OPEN

Descrição:
Algumas moedas parecem estar vinculadas/duplicadas como gêmeas. Ao coletar uma moeda, outras moedas também somem.

Resultado esperado:
Somente a moeda coletada deve desaparecer.

---

## [P0][BUG] Spawn automático de inimigos não continua após matar o primeiro
STATUS: OPEN

Descrição:
Só aparece 1 inimigo. Quando ele morre, não aparecem novos inimigos e o jogo para de gerar ameaça.

Resultado esperado:
Inimigos devem continuar aparecendo ao longo do tempo, respeitando limite máximo configurável.

