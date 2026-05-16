# FerroSurvivor - Roadmap

## Objetivo do Projeto
Criar um protótipo indie pequeno, estilo Vampire Survivors, com tema ferroviário/logístico.

## Estado Atual
- Player com movimentação WASD
- Inimigo perseguindo o player
- Sistema de HP
- Ataque com espaço
- Inimigo morre
- Inimigos com nível, HP escalável e XP dropado por nível
- Drop e coleta de XP
- Progressão simples de level com aumento de dano e vida máxima
- HUD com HP, moedas, level, XP e stats principais
- Reinício ao morrer
- Moedas coletáveis
- Projeto versionado no GitHub

## Próximas Features Prioritárias

### 1. Spawn automático de inimigos
Criar inimigos surgindo ao longo do tempo, reutilizando `enemy.tscn` e `configure_level()` para suportar inimigos de níveis diferentes.

### 2. Escolhas de upgrade no level up
Adicionar escolhas simples quando o player sobe de level.

### 3. Upgrades simples
- Mais dano
- Mais velocidade
- Mais vida
- Ataque maior

### 4. Timer de sobrevivência
Mostrar tempo vivo na tela.

### 5. Balanceamento inicial
Ajustar HP, dano, velocidade, spawn rate, XP e curva de progressão.

## Regras de Desenvolvimento
- Implementar uma feature por vez
- Sempre testar no Godot
- Sempre fazer commit após funcionar
- Evitar sistemas grandes demais
- Manter scripts pequenos e organizados
