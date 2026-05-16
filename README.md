# FerroSurvivor

Protótipo inicial em Godot 4 para um jogo top-down simples inspirado em Vampire Survivors com tema ferroviário/logístico.

## Como abrir

1. Abra o Godot 4.
2. Selecione **Importar**.
3. Escolha `C:\jogo\FerroSurvivor\project.godot`.
4. Execute a cena principal.

## Controles

- `W`: mover para cima
- `A`: mover para a esquerda
- `S`: mover para baixo
- `D`: mover para a direita
- `Espaco`: atacar inimigos próximos

## Estrutura

```text
FerroSurvivor/
├── project.godot
├── icon.svg
├── scenes/
│   ├── enemies/
│   │   └── enemy.tscn
│   ├── items/
│   │   ├── coin.tscn
│   │   └── experience.tscn
│   ├── player/
│   │   └── player.tscn
│   ├── ui/
│   │   └── hud.tscn
│   └── world/
│       └── world.tscn
└── scripts/
    ├── enemies/
    │   └── enemy.gd
    ├── items/
    │   ├── coin.gd
    │   └── experience.gd
    ├── player/
    │   └── player.gd
    ├── ui/
    │   └── hud.gd
    └── world/
        └── world.gd
```

## Cenas

- `scenes/world/world.tscn`: cena principal. Instancia o mapa simples, o player, um inimigo, moedas de teste e o HUD.
- `scenes/player/player.tscn`: cena do personagem. Contém colisão, câmera, área de ataque, timers e feedback visual do ataque.
- `scenes/enemies/enemy.tscn`: cena do inimigo. Contém colisão, área de dano por toque, timer de dano contínuo e indicação simples de nível para inimigos acima do nível 1.
- `scenes/items/coin.tscn`: moeda coletável que desaparece ao tocar no player.
- `scenes/items/experience.tscn`: item de experiência coletável dropado quando um inimigo morre.
- `scenes/ui/hud.tscn`: HUD minimalista com HP, moedas, level, XP e stats principais do player.

## Scripts

- `scripts/world/world.gd`: conecta os sinais do player ao HUD, conta moedas coletadas e reinicia a cena quando o player morre.
- `scripts/player/player.gd`: controla movimento, vida, dano recebido, ataque por área, XP, level, crescimento de stats e sinal de morte.
- `scripts/enemies/enemy.gd`: faz o inimigo perseguir o player, causar dano por toque, receber dano, escalar stats por nível e dropar XP ao morrer.
- `scripts/items/coin.gd`: emite sinal de coleta quando o player toca na moeda e remove a moeda da cena.
- `scripts/items/experience.gd`: adiciona XP ao player quando coletado e remove o item da cena.
- `scripts/ui/hud.gd`: atualiza os textos de HP, moedas, level, XP e stats exibidos na tela.

## Sistemas atuais

### Movimento

O player usa `CharacterBody2D` e `Input.get_vector` para movimentação top-down com WASD.

### Câmera

A câmera fica dentro da cena do player e acompanha o personagem com suavização simples.

### Vida do player

O player possui `max_health` e `current_health`. Ao receber dano, emite `health_changed` para atualizar o HUD. Ao chegar em 0 HP, emite `died`.

### Inimigo

O inimigo usa `CharacterBody2D`, encontra o primeiro node no grupo `player` e se move em direção a ele. Ao tocar no player, aplica dano imediatamente e continua aplicando dano em intervalo simples enquanto o contato continuar.

### Níveis de inimigo

Cada inimigo possui `level`, HP máximo escalável e XP dropado com base no nível. A função `configure_level()` permite que futuros sistemas de spawn definam níveis diferentes sem recriar a cena do inimigo.

### Ataque

O player ataca com `Espaco`. O ataque usa uma `Area2D` chamada `AttackArea` para encontrar inimigos próximos no grupo `enemies`. Cada inimigo atingido recebe dano pelo método `take_damage`.

### Morte do inimigo e XP

Quando o HP do inimigo chega a 0, ele instancia `scenes/items/experience.tscn` na própria posição antes de sair da cena. O item de XP pode ser coletado pelo player ao encostar.

### Progressão do player

Ao coletar XP suficiente, o player sobe de level. Cada level aumenta o dano do ataque e a vida máxima. O HUD mostra level, XP atual, XP necessário, dano e vida máxima.

### Moedas coletáveis

As moedas são `Area2D` no grupo `coins`. Ao tocar no player, a moeda emite `collected` e chama `queue_free()`. O `world.gd` escuta esse sinal, incrementa o contador e atualiza o HUD.

### Feedback visual

Ao atacar, o player mostra brevemente um `ColorRect` semi-transparente ao redor do personagem. Nenhum asset externo é usado.

### Reinício ao morrer

Quando o player morre, `world.gd` chama `reload_current_scene` de forma diferida para reiniciar o protótipo.

## Escopo atual

Este projeto contém sistemas básicos para o protótipo: player, câmera, mapa simples, inimigo perseguindo, colisão, vida, dano ao toque, ataque simples, morte do inimigo, drop/coleta de XP, progressão simples de level/stats, moedas coletáveis, reinício ao morrer e HUD de HP/moedas/XP/stats. Sistemas complexos como ondas, inventário, menus, escolhas de upgrade e combate avançado ainda não foram implementados.
