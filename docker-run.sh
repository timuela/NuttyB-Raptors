#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default argument if none provided
ARG="${1:-}"

# Build the Docker image if it doesn't exist
docker build -t nutty-b64-converter "$SCRIPT_DIR"

# Create a temporary file to capture output
TEMP_FILE=$(mktemp)

# Create temporary directory for clipboard file
CLIPBOARD_DIR=$(mktemp -d)

# Run the container with volume mounts and capture output
docker run --rm \
    -e CONTAINER_FILE_OUTPUT=1 \
    -v "$SCRIPT_DIR/lua:/app/lua" \
    -v "$SCRIPT_DIR/base64url:/app/base64url" \
    -v "$CLIPBOARD_DIR:/app/clipboard" \
    nutty-b64-converter luatob64 "$ARG" > "$TEMP_FILE" 2>&1

# Check if clipboard file was created and copy its content
if [[ -f "$CLIPBOARD_DIR/clipboard-content.txt" ]]; then
    # Detect available clipboard tool
    if command -v xclip >/dev/null 2>&1; then
        cat "$CLIPBOARD_DIR/clipboard-content.txt" | xclip -selection clipboard
        echo "Copied to clipboard successfully"
    elif command -v xsel >/dev/null 2>&1; then
        cat "$CLIPBOARD_DIR/clipboard-content.txt" | xsel --clipboard --input
        echo "Copied to clipboard successfully"
    elif command -v pbcopy >/dev/null 2>&1; then
        cat "$CLIPBOARD_DIR/clipboard-content.txt" | pbcopy
        echo "Copied to clipboard successfully"
    else
        echo "Warning: No clipboard utility found, content saved to file"
        echo "Content: $(cat "$CLIPBOARD_DIR/clipboard-content.txt")"
    fi
    rm -f "$CLIPBOARD_DIR/clipboard-content.txt"
else
    echo "No clipboard content file found"
fi

# Clean up clipboard directory
rm -rf "$CLIPBOARD_DIR"

# Display the output (excluding clipboard status)
if [[ -s "$TEMP_FILE" ]]; then
    grep -v "CLIPBOARD_FILE_WRITTEN" "$TEMP_FILE"
else
    echo "No content in output file"
fi

# If DEBUG environment variable is set, show full output
if [[ "$DEBUG" == "1" ]]; then
    echo
    echo "=== Full Raw Output ==="
    cat "$TEMP_FILE"
    echo
    echo "=== Clipboard File Content ==="
    if [[ -f "$CLIPBOARD_DIR/clipboard-content.txt" ]]; then
        cat "$CLIPBOARD_DIR/clipboard-content.txt"
    else
        echo "No clipboard file found"
    fi
fi

# Clean up temp file
rm -f "$TEMP_FILE"
