# dungeon_delve
A dungeon delver Twitter bot!

## setup

```
  rake db:reset
  rake db:seed
```
## testing in console

```
  Map.reset
  player = Player.first
  Party.add_player(player)
  Command.process("look", player)
  Command.process("east", player)
```
