# Tornjak.io Examples

To build and push images to the repository:
```console
make all
```

Once the `sidecar` deployed in SPIRE environment, execute inside the container
and issue:

```console
/opt/spire/bin/spire-agent api fetch jwt -audience vault -socketPath /run/spire/sockets/agent.sock
```
Then use the token to obtain the `config.ini` from the Vault
(To Be Continue)
