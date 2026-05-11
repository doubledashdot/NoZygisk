# NoZygisk

NoZygisk is a fork of ReZygisk, a standalone implementation of the Zygisk API for KernelSU.

## Why does NoZygisk exist??

Because I (skye) thought it would be funny to maintain this.

## Advantages

- None, it's the same as ReZygisk, but I do some non-sense modding to it.

## Dependencies

| Tool            | Description                            |
|-----------------|----------------------------------------|
| `Android NDK`   | Native Development Kit for Android     |

### C Dependencies

| Dependency  | Description                   |
|-------------|-------------------------------|
| `PLTI`      | Simple PLT Hook for Android   |
| `CSOLoader` | SOTA Linux custom linker      |

## Installation

### 1. Select the right zip

The selection of the build/zip is important, as it will determine how hidden and stable ReZygisk will be. This, however, is not a hard task:

- `release` should be the one chosen for most cases, it removes app-level logging and offers more optimized binaries.
- `debug`, however, offers the opposite, with heavy logging and no optimizations, For this reason, **you should only use it for debugging purposes** and **when obtaining logs for creating an Issue**.

### 2. Flash the zip

After choosing the right build, you should flash it using KernelSU. You can do this by going to the `Modules` section and selecting the zip you downloaded.

After flashing, check the installation logs to ensure there are no errors, and if everything is fine, you can reboot your device.

> [!WARNING]
> NoZygisk requires that you already have the Zygisk modules you need pre-installed, as most of them check for ReZ or ZN, not for NoZ.

### 3. Verify the installation

After rebooting, you can verify if NoZygisk is working properly by checking the module description in the `Modules` section of KernelSU. The description should indicate that the necessary daemons are running. It should look similar to this: `[Status: ✅, ReZygisk 64-bit: ✅] Standalone implementation of Zygisk.`

## Support

There isn't any as of now lmao, you have to rely on Github Issues and my mood.

## License

NoZygisk is licensed under [AGPL 3.0](./LICENSE). You can read more about it on [Open Source Initiative](https://opensource.org/licenses/AGPL-3.0).
