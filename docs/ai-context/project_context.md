# FerroSurvivor - Contexto para IA

## Objetivo
FerroSurvivor é um protótipo indie em Godot 4, estilo Vampire Survivors, com tema ferroviário/logístico.

## Estado Atual do Jogo
- Player com movimentação WASD
- Inimigo perseguindo player
- Sistema de HP
- Ataque com espaço
- Inimigo morre ao chegar em 0 HP
- Inimigos possuem nível, HP escalável e XP dropado por nível
- Inimigos dropam item de XP ao morrer
- Player coleta XP ao encostar no item
- Player sobe de level ao acumular XP suficiente
- Level aumenta dano e vida máxima do player
- HUD mostrando HP, moedas, level, XP e stats principais
- Moedas coletáveis
- Reinício da cena ao morrer

## Arquitetura Atual
- scenes/player/player.tscn
- scripts/player/player.gd
- scenes/enemies/enemy.tscn
- scripts/enemies/enemy.gd
- scenes/items/coin.tscn
- scripts/items/coin.gd
- scenes/items/experience.tscn
- scripts/items/experience.gd
- scenes/ui/hud.tscn
- scripts/ui/hud.gd
- scenes/world/world.tscn
- scripts/world/world.gd

## Regras para IA
- Não recriar sistemas já existentes sem necessidade
- Não alterar ataque, HP, moedas ou inimigos sem motivo claro
- Implementar uma feature por vez
- Fazer a menor alteração funcional possível
- Manter cenas e scripts separados por responsabilidade
- Atualizar README.md quando criar feature nova
- Atualizar ROADMAP.md quando concluir item do roadmap

## Próxima Feature Prioritária
Spawn automático de inimigos usando o enemy.tscn existente. O spawn deve reutilizar `configure_level()` para criar inimigos de níveis diferentes quando necessário.
