import socket
import sys

def scan_port(host, port, timeout=0.3):
    """Return True when a TCP connection can be established."""
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.settimeout(timeout)
        return sock.connect_ex((host, port)) == 0

def main():
    if len(sys.argv) != 4:
        print("Usage: python3 scanner.py <host> <start_port> <end_port>")
        raise SystemExit(1)

    host = sys.argv[1]

    try:
        start_port = int(sys.argv[2])
        end_port = int(sys.argv[3])
    except ValueError:
        print("[-] Ports must be integers.")
        raise SystemExit(1)

    if host not in {"127.0.0.1", "localhost"}:
        print("[-] This training scanner is restricted to localhost.")
        raise SystemExit(1)

    if not (1 <= start_port <= end_port <= 65535):
        print("[-] Invalid port range.")
        raise SystemExit(1)

    print(f"[*] Scanning {host} TCP {start_port}-{end_port}")

    open_ports = []

    # TODO 1:
    # Loop through every port in the requested range.

    # TODO 2:
    # Call scan_port(host, port) for each port.

    # TODO 3:
    # Append open ports to open_ports and print them as they are found.

    # TODO 4:
    # Print a final summary showing how many open ports were discovered.

    print(f"[+] Open ports: {open_ports}")

if __name__ == "__main__":
    main()
