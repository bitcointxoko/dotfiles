### netns-isolation (EXPERIMENTAL)
# Enable this module to use Network Namespace Isolation. This feature places
# every service in its own network namespace and only allows truly necessary
# connections between network namespaces, making sure services are isolated on
# a network-level as much as possible.
{ nix-bitcoin.netns-isolation.enable = true; }
