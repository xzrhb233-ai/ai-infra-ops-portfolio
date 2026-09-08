#!/bin/bash
# W2 D11: GPU driver/PCIe/kernel/disk/network + CUDA container validation,
# run against a live GPU instance entirely through SSM send-command (no SSH).
# Mirrors the exact checks from W1 Day 3 (local-gpu/) so the local-vs-AWS
# comparison in local-vs-cloud-benchmark.md is apples to apples.
#
# Usage: verify-gpu.sh <instance-id> <profile> <region>
set -euo pipefail

INSTANCE_ID="$1"
PROFILE="${2:-personal-admin}"
REGION="${3:-us-east-2}"
AWS="/home/summer/.local/bin/aws"
PARAMS_FILE="$(mktemp)"

cat > "$PARAMS_FILE" <<'EOF'
{
  "commands": [
    "echo === nvidia-smi ===",
    "nvidia-smi --query-gpu=name,memory.total,driver_version,pstate --format=csv",
    "echo === PCIe GPU device ===",
    "lspci | grep -i nvidia",
    "echo === kernel ===",
    "uname -a",
    "echo === disk ===",
    "df -h /",
    "echo === network ===",
    "ip -brief addr",
    "echo === docker without --gpus (expected to fail, see incident-01) ===",
    "docker run --rm nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi || echo EXPECTED_FAILURE",
    "echo === docker with --gpus all ===",
    "docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi"
  ]
}
EOF

CMD_ID=$("$AWS" ssm send-command --profile "$PROFILE" --region "$REGION" \
  --instance-ids "$INSTANCE_ID" --document-name AWS-RunShellScript \
  --parameters "file://$PARAMS_FILE" --query "Command.CommandId" --output text)

echo "Command dispatched: $CMD_ID -- waiting for completion..."
"$AWS" ssm wait command-executed --profile "$PROFILE" --region "$REGION" \
  --command-id "$CMD_ID" --instance-id "$INSTANCE_ID" || true

"$AWS" ssm get-command-invocation --profile "$PROFILE" --region "$REGION" \
  --command-id "$CMD_ID" --instance-id "$INSTANCE_ID"

rm -f "$PARAMS_FILE"
