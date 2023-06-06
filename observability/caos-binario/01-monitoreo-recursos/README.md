#

## Coding

### working with docker compose
```bash
docker compose pull

docker images

docker compose up -d

# check the application
curl http://localhost


# check the application metrics
curl http://localhost/metrics


# check the Prometheus dashboar
curl http://localhost:9090

# go to Prometheus target dashboard
curl http://127.0.0.1:9090/targets


# go to Graphana dashboard
curl http://127.0.0.1:3000/

```



---
## References

- [Playlist](https://www.youtube.com/watch?v=PCJwJpbln6Q&list=PLC-jxfv-8E7L-w6bdX61qa4ehrrgCIh4R)

- [Episode 1 Monitoreo con Docker (Grafana, Prometheus, Node Exporter, cAdvisor)](https://www.youtube.com/watch?v=PCJwJpbln6Q&list=PLC-jxfv-8E7L-w6bdX61qa4ehrrgCIh4R&index=1)

- [Caos Binario Repository](https://github.com/caosbinario/observability)

- [Prometheus Example App](https://github.com/brancz/prometheus-example-app)