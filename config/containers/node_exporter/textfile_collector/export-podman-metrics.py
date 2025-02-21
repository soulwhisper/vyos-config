#!/usr/bin/env python3

import json
import subprocess
import os

METRICS_FILE = "/config/container/node_exporter/textfile_collector/podman_metrics.prom"

def run_command(command):
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if result.returncode != 0:
        raise RuntimeError(f"Command failed: {result.stderr}")
    return result.stdout

def convert_memory_to_bytes(memory_str):
    memory_value = memory_str.strip()
    if memory_value.endswith("kB"):
        return int(float(memory_value[:-2]) * 1024)
    elif memory_value.endswith("MB"):
        return int(float(memory_value[:-2]) * 1024 * 1024)
    elif memory_value.endswith("GB"):
        return int(float(memory_value[:-2]) * 1024 * 1024 * 1024)
    elif memory_value.endswith("B"):
        return int(memory_value[:-1])
    else:
        return int(memory_value)

def get_memory_limit(container_id):
    inspect_json = run_command(["podman", "inspect", container_id])
    inspect_data = json.loads(inspect_json)[0]
    mem_limit = inspect_data.get("HostConfig", {}).get("Memory")
    return mem_limit if mem_limit is not None else 0

def main():
    # Collect container metrics
    container_metrics_json = run_command(["podman", "ps", "--all", "--format=json"])
    container_metrics = json.loads(container_metrics_json)

    # Prepare to write metrics to file
    with open(METRICS_FILE, "w") as f:
        f.write("# HELP podman_container_cpu_usage CPU usage fraction\n")
        f.write("# TYPE podman_container_cpu_usage gauge\n")
        f.write("# HELP podman_container_memory_usage_bytes Memory usage in bytes\n")
        f.write("# TYPE podman_container_memory_usage_bytes gauge\n")
        f.write("# HELP podman_container_memory_limit_bytes Memory limit in bytes\n")
        f.write("# TYPE podman_container_memory_limit_bytes gauge\n")
        f.write("# HELP podman_container_restarts_total Number of container restarts\n")
        f.write("# TYPE podman_container_restarts_total counter\n")
        f.write("# HELP podman_container_status Container status (0 = exited, 1 = running)\n")
        f.write("# TYPE podman_container_status gauge\n")

        for container in container_metrics:
            name = container['Names'][0]
            container_id = container['Id']
            restarts = container.get('RestartCount', 0)
            status = container['State']

            if status == "running":
                status_value = 1
            else:
                status_value = 0

            stats_json = run_command(["podman", "stats", container_id, "--no-stream", "--format=json"])
            stats = json.loads(stats_json)[0]

            cpu_usage_str = stats['cpu_percent'].strip('%')
            cpu_usage = float(cpu_usage_str) / 100

            mem_usage_str, _ = stats['mem_usage'].split('/')
            mem_usage = convert_memory_to_bytes(mem_usage_str)
            mem_limit = get_memory_limit(container_id)

            f.write(f'podman_container_cpu_usage{{container_name="{name}"}} {cpu_usage}\n')
            f.write(f'podman_container_memory_usage_bytes{{container_name="{name}"}} {mem_usage}\n')
            f.write(f'podman_container_memory_limit_bytes{{container_name="{name}"}} {mem_limit}\n')
            f.write(f'podman_container_restarts_total{{container_name="{name}"}} {restarts}\n')
            f.write(f'podman_container_status{{container_name="{name}",status="{status}"}} {status_value}\n')

if __name__ == "__main__":
    main()