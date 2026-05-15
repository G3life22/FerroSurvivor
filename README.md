# FerroSurvivor

Protótipo inicial em Godot 4 para um jogo top-down simples.

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
│   ├── player/
│   │   └── player.tscn
│   ├── ui/
│   │   └── hud.tscn
│   └── world/
│       └── world.tscn
└── scripts/
    ├── enemies/
    │   └── enemy.gd
    ├── player/
    │   └── player.gd
    ├── ui/
    │   └── hud.gd
    └── world/
        └── world.gd
```

## Cenas

- `scenes/world/world.tscn`: cena principal. Instancia o mapa simples, o player, um inimigo, moedas de teste e o HUD.
- `scenes/player/player.tscn`: cena do personagem. Contem colisao, camera, area de ataque, timers e feedback visual do ataque.
- `scenes/enemies/enemy.tscn`: cena do inimigo. Contem colisao, area de dano por toque e timer de dano continuo.
- `scenes/items/coin.tscn`: moeda coletavel que desaparece ao tocar no player.
- `scenes/ui/hud.tscn`: HUD minimalista com o HP do player.

## Scripts

- `scripts/world/world.gd`: conecta os sinais do player ao HUD, conta moedas coletadas e reinicia a cena quando o player morre.
- `scripts/player/player.gd`: controla movimento, vida, dano recebido, ataque por area e sinal de morte.
- `scripts/enemies/enemy.gd`: faz o inimigo perseguir o player, causar dano por toque, receber dano e morrer ao chegar em 0 HP.
- `scripts/items/coin.gd`: emite sinal de coleta quando o player toca na moeda e remove a moeda da cena.
- `scripts/ui/hud.gd`: atualiza os textos de HP e moedas exibidos na tela.

## Sistemas atuais

### Movimento

O player usa `CharacterBody2D` e `Input.get_vector` para movimentacao top-down com WASD.

### Camera

A camera fica dentro da cena do player e acompanha o personagem com suavizacao simples.

### Vida do player

O player possui `max_health` e `current_health`. Ao receber dano, emite `health_changed` para atualizar o HUD. Ao chegar em 0 HP, emite `died`.

### Inimigo

O inimigo usa `CharacterBody2D`, encontra o primeiro node no grupo `player` e se move em direcao a ele. Ao tocar no player, aplica dano imediatamente e continua aplicando dano em intervalo simples enquanto o contato continuar.

### Ataque

O player ataca com `Espaco`. O ataque usa uma `Area2D` chamada `AttackArea` para encontrar inimigos próximos no grupo `enemies`. Cada inimigo atingido recebe dano pelo metodo `take_damage`.

### Morte do inimigo

O inimigo possui HP simples. Quando chega a 0 HP, chama `queue_free()` e sai da cena.

### Moedas coletaveis

As moedas sao `Area2D` no grupo `coins`. Ao tocar no player, a moeda emite `collected` e chama `queue_free()`. O `world.gd` escuta esse sinal, incrementa o contador e atualiza o HUD.

### Feedback visual

Ao atacar, o player mostra brevemente um `ColorRect` semi-transparente ao redor do personagem. Nenhum asset externo e usado.

### Reinicio ao morrer

Quando o player morre, `world.gd` chama `reload_current_scene` de forma diferida para reiniciar o prototipo.

## Escopo atual

Este projeto contem apenas sistemas basicos para o prototipo: player, camera, mapa simples, inimigo perseguindo, colisao, vida, dano ao toque, ataque simples, morte do inimigo, moedas coletaveis, reinicio ao morrer e HUD de HP/moedas. Sistemas complexos como ondas, inventario, progressao, menus e combate avancado ainda nao foram implementados.
