# dungeon_delve
A dungeon delver Twitter bot!

## setup

```
  $ mv .env.sample .env
```

Configure your Twitter credentials in `.env`

```
  $ rake db:reset
  $ rake db:seed
```
## testing in console

```
  Map.reset
  player = Player.first
  Party.add_player(player)
  Command.process("look", player)
  Command.process("east", player)
```
