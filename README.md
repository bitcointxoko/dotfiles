[es](#cómo-utilizar-este-repositorio) | [en](#how-to-use-this-repository)

[nix-bitcoin](https://github.com/fort-nix/nix-bitcoin) es una colección de paquetes Nix relacionados con Bitcoin que facilitan la instalación y configuración de un nodo Bitcoin completo seguro de forma fiable y reproducible gracias a la naturaleza declarativa de Nix. Este repositorio contiene un ejemplo de despliegue de un nodo Bitcoin completo y servicios adicionales utilizando nix-bitcoin con fines educativos. Hay muchas otras formas de desplegar nodos nix-bitcoin, por favor consulta el [repositorio principal](https://github.com/fort-nix/nix-bitcoin/blob/master/docs/install.md) para más información.

[nix-bitcoin](https://github.com/fort-nix/nix-bitcoin) is a collection of Bitcoin-related Nix packages that make it easy to set up and configure a secure Bitcoin full node in a reliable and reproducible manner thanks to the declarative nature of Nix. This repo contains an example deployment of a Bitcoin full node and additional services using nix-bitcoin for educational purposes. There are many other ways to deploy nix-bitcoin nodes, please consult the [main repository](https://github.com/fort-nix/nix-bitcoin/blob/master/docs/install.md) for more information.

## Cómo utilizar este repositorio

Puedes empezar a ejecutar un nodo bitcoin con sólo unos pocos comandos usando el código de este repositorio. Para la configuración más rápida, consulta [Instalación rápida](#instalación-rápida).

Si eres nuevo en Nix o NixOS y quieres un poco más de información sobre lo que ocurre en segundo plano, puedes echar un vistazo a la [Guía Detallada](https://github.com/bitcointxoko/guides/blob/main/es/nix-bitcoin-01.md) donde cubrimos los pasos desde la instalación de NixOS en una VM hasta la configuración de tu primer servicio nix-bitcoin (bitcoind).

## Instalación rápida

0. Instala NixOS en una máquina/VM si aún no lo has hecho. Asegúrate de que puedes usar `git`.
1. Clona este repositorio

```bash
git clone https://github.com/bitcointxoko/dotfiles.git
cd dotfiles
```

2. Copia tu `hardware-configuration.nix` y `configuration.nix` de `/etc/nixos` al directorio actual.

```bash
cp /etc/nixos/hardware-configuration.nix .
cp /etc/nixos/configuration.nix .
```

3. Edita `configuration.nix` según tus preferencias. Puedes consultar `configuration-example.nix` en la raíz de este repositorio para obtener sugerencias. Habilita los flakes antes del siguiente paso si es necesario.

```bash
nano configuration.nix
```

4. Reconstruye NixOS usando flakes.

```bash
sudo nixos-rebuild switch --flake .
```

### Habilitar un servicio

Descomenta la línea que contiene el módulo de servicio que deseas habilitar en la sección imports de `configuration.nix`.

Por ejemplo, lo siguiente habilita el servicio `bitcoind` y el servicio `clightning`.

```nix
# configuration.nix

{ pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ./system/bitcoin/bitcoind.nix
    ./system/bitcoin/clightning.nix
    # ...
  ];

  # ...

}
```

## Descargo de responsabilidad

El código en este repositorio es sólo para fines educativos. El código puede no estar probado. Asegúrate de que sabes lo que estás haciendo antes de usarlo con fondos reales. Lee también el descargo de responsabilidad de nix-bitcoin.

---

## How to use this repository

You can start running a bitcoin node with just a few commands using the code in this repository. For the quickest setup, please refer to [Quick Install](#quick-install).

If you are new to Nix or NixOS and want a bit more information about what happens in the background, you can take a look at the [Detailed Guide](https://github.com/bitcointxoko/guides/blob/main/en/nix-bitcoin-01.md) where we cover the steps from installing NixOS in a VM to setting up your first nix-bitcoin service (bitcoind).

## Quick Install

0. Install NixOS on a machine/VM if you haven't already done so. Make sure you can use `git`
1. Clone this repository

```bash
git clone https://github.com/bitcointxoko/dotfiles.git
cd dotfiles
```

2. Copy your `hardware-configuration.nix` and `configuration.nix` from `/etc/nixos` to the current directory.

```bash
cp /etc/nixos/hardware-configuration.nix .
cp /etc/nixos/configuration.nix .
```

3. Edit `configuration.nix` as needed to suit your preferences. You can refer to `configuration-example.nix` in the root of this repository for hints. Enable flakes before the next step if you need to.

```bash
nano configuration.nix
```

4. Rebuild NixOS using flakes.

```bash
sudo nixos-rebuild switch --flake .
```

### Enable a service

Uncomment the line containing the service module you want to enable in the imports section of `configuration.nix`.

For example, the following enables the `bitcoind` service and the `clightning` service.

```nix
# configuration.nix

{ pkgs, ...}:
{
  imports = [
    ./hardware-configuration.nix
    ./system/bitcoin/bitcoind.nix
    ./system/bitcoin/clightning.nix
    # ...
  ];

  # ...

}
```

## Disclaimer

The code in this repository is for educational purposes only. Code might be untested. Make sure you know what you are doing before using it with real funds! Also read the disclaimer from nix-bitcoin.
