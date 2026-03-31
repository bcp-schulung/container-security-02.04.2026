docker run --rm -it \
           --name falco \
           --privileged \
           -v /sys/kernel/tracing:/sys/kernel/tracing:ro \
           -v /var/run/docker.sock:/host/var/run/docker.sock \
           -v /proc:/host/proc:ro \
           -v /etc:/host/etc:ro \
           falcosecurity/falco:0.43.0

sudo cat /etc/shadow

docker run --rm -it \
           --name falco \
           --privileged \
           -v /sys/kernel/tracing:/sys/kernel/tracing:ro \
           -v /var/run/docker.sock:/host/var/run/docker.sock \
           -v /proc:/host/proc:ro \
           -v /etc:/host/etc:ro \
           -v $(pwd)/falco_custom_rules.yaml:/etc/falco/falco_rules.local.yaml \
           falcosecurity/falco:0.43.0

sudo touch /etc/test_file_falco_rule
